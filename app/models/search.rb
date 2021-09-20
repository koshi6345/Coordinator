class Search < ApplicationRecord
  def take_colors(image_url, quantity: 10, threshold: 1)
    return [] if image_url.nil?
    image = MiniMagick::Image.open(image_url)
    result = image.run_command('convert', image_url, '-format', '%c', '-colors', quantity, '-depth', 8, 'histogram:info')
  
    frequencies = result.scan(/([0-9]+)\:/).flatten.map { |m| m.to_f }
    hex_values = result.scan(/(\#[0-9ABCDEF]{6})/).flatten
  
    total_frequencies = colors.reduce(0.0) { |sum, (_, freq)| sum += freq }.to_f
    colors.
      map { |(hex, freq)| [hex, (freq * 100 / total_frequencies).to_i] }.
      reject { |(hex, freq)| freq < threshold }.
      sort_by { |(hex, freq)| freq }.reverse
  end
end
