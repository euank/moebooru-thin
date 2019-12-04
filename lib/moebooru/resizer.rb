module Moebooru
  module Resizer
    class ResizeError < Exception; end

    BGCOLOR = (CONFIG["bgcolor"] if defined? CONFIG) || 255

    # Token from https://github.com/danbooru/danbooru/blob/a7dd05fc8fa84aff1145d6c6f2502f7f45c534cb/app/logical/danbooru_image_resizer.rb
    SRGB_PROFILE = "#{Rails.root}/config/sRGB.icm"
    # http://jcupitt.github.io/libvips/API/current/libvips-resample.html#vips-thumbnail
    THUMBNAIL_OPTIONS = { size: :down, linear: false, no_rotate: true, export_profile: SRGB_PROFILE, import_profile: SRGB_PROFILE }
    JPEG_OPTIONS = { background: BGCOLOR, strip: true, interlace: true, optimize_coding: true }

    def resize(file_ext, input_path, output_path, output_size, output_quality)
      resized_image = Vips::Image.thumbnail(input_path, output_size[:width], height: output_size[:height], **THUMBNAIL_OPTIONS)
      resized_image.jpegsave(output_path, Q: output_quality, **JPEG_OPTIONS)
    end

    # If allow_enlarge is true, always scale to fit, even if the source area is
    # smaller than max_size.
    #
    # If min_max is true, max_size[:width] and max_size[:height] are treated as bounding
    # the greater and lesser dimensions of the image.  For example, if max_size is 1500x1000,
    # then a landscape image will be scaled to 1500x1000, and a portrait image will be
    # 1000x1500.
    # the maximum scaling to 1000x1500.
    def reduce_to(size, max_size, ratio = 1, allow_enlarge = false, min_max = false)
      ret = size.dup

      if min_max
        if max_size[:width] < max_size[:height] != size[:width] < size[:height]
          max_size[:width], max_size[:height] = max_size[:height], max_size[:width]
        end
      end

      if allow_enlarge
        if ret[:width] < max_size[:width]
          scale = max_size[:width].to_f / ret[:width].to_f
          ret[:width] = ret[:width] * scale
          ret[:height] = ret[:height] * scale
        end

        if max_size[:height] && (ret[:height] < ratio * max_size[:height])
          scale = max_size[:height].to_f / ret[:height].to_f
          ret[:width] = ret[:width] * scale
          ret[:height] = ret[:height] * scale
        end
      end

      if ret[:width] > ratio * max_size[:width]
        scale = max_size[:width].to_f / ret[:width].to_f
        ret[:width] = ret[:width] * scale
        ret[:height] = ret[:height] * scale
      end

      if max_size[:height] && (ret[:height] > ratio * max_size[:height])
        scale = max_size[:height].to_f / ret[:height].to_f
        ret[:width] = ret[:width] * scale
        ret[:height] = ret[:height] * scale
      end

      ret[:width] = ret[:width].round
      ret[:height] = ret[:height].round
      ret
    end

    module_function :resize
    module_function :reduce_to
  end
end
