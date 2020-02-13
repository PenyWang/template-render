require "i18n/js/formatters/base"

module I18n
  module JS
    module Formatters
      class JS < Base
        def format(translations)
          contents = header
          translations.each do |locale, translations_for_locale|
            contents << line(locale, format_json(translations_for_locale))
          end
          contents << footer
        end

        protected

        def header
          text = @prefix || ''
          text + %(#{@namespace}.translations || (#{@namespace}.translations = {});\n)
        end

        def footer
          @suffix || ''
        end

        def line(locale, translations)
          if @js_extend
            %(#{@namespace}.translations["#{locale}"] = I18n.extend((#{@namespace}.translations["#{locale}"] || {}), #{translations});\n)
          else
            %(#{@namespace}.translations["#{locale}"] = #{translations};\n)
          end
        end
      end
    end
  end
end
