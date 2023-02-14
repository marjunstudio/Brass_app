module ApplicationHelper
  def default_meta_tags
    {
      site: 'Animatone',
      title: '吹奏楽曲検索&視聴サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'Animatoneでは吹奏楽曲をタイトル名、カテゴリ、作曲者から検索し、Youtube動画を一覧でみることができます。',
      keywords: '吹奏楽、楽曲検索',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        # image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      # twitter: {
      #   card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
      #   site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
      #   image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      # }
    }
  end
end