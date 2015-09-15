module TweetsHelper
  def build_followers_data(name)
    data_hash = {}

    followers = $twitter_client.followers(name)

    total_tweets = 0

    followers.each do |follower|
      data_hash["#{follower.id}"] = {
        tweets_count: follower.statuses_count,
        image_url: follower.profile_image_uri(:bigger).to_s
      }
      total_tweets += follower.statuses_count
    end

    data_hash.map { |key, value| value[:percentage] = value[:tweets_count].to_f / total_tweets }

    data_hash
  end

  def build_image(name, options = {})
    data_hash = build_followers_data(name)

    MiniMagick::Tool::Montage.new do |montage|
      montage << '-mode'
      montage << 'concatenate'
      montage << '-tile'
      montage << "#{options[:cols]}x#{options[:rows]}"
      data_hash.each do |k, v|
        montage << "#{v[:image_url]}"
      end
      montage << "#{Settings.output_file.path}#{Settings.output_file.name}#{Settings.output_file.format}"
    end
  end

end
