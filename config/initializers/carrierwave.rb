if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARDFY2AOIQB3QC4OY',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1' # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = 'pujjji' # 作成したS3バケット名
  end
end

