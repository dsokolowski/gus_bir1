# frozen_string_literal: true

module GusBir1
  module Response
    class Summary
      def initialize(body)
        @body = body
      end

      attr_reader :body

      def to_h
        n = Nokogiri.XML body
        n.xpath('//dane').map { |dane| Nori.new.parse(dane.to_s)['dane'] }
      end
    end
  end
end
