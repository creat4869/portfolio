module ApplicationHelper
  def default_meta_tags
    {
      site: 'portfolio-s',
      title: 'portfolio',
      reverse: true,
      description: 'Web制作・Webデザイン・エンジニア・イラストレーターとして活動しているsayaのポートフォリオサイトです。Webサービスの作成依頼はもちろん漫画LPなどの依頼もお任せ下さい！',
      keywords: 'ポートフォリオ,web制作,webデザイナー,イラストレーター',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'portfolio-s',
        title: 'portfolio',
        description: 'Web制作・Webデザイン・エンジニア・イラストレーターとして活動しているsayaのポートフォリオサイトです。Webサービスの作成依頼はもちろん漫画LPなどの依頼もお任せ下さい！',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@03iZero',
      }
    }
  end
end
