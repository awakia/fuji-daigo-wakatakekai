class Page
  attr_accessor :path, :title, :parent, :within

  def initialize(path: nil, title: nil, parent: nil, within: nil)
    @path = path
    @title = title
    @parent = parent
    @within = within
  end

  def path
    @path.try(:to_sym)
  end

  def title
    @title.try(:html_safe)
  end

  def parent
    @parent.try(:to_sym)
  end

  def self.find(path)
    self.all.find { |x| x.path.to_s == path.to_s }
  end

  def self.all
    @@all ||= [
      Page.new(path: :root, title: 'トップページ'),
      Page.new(path: :root_top, title: 'トップページ(上部)', within: :root),
      Page.new(path: :root_side, title: 'トップページ(右側)', within: :root),
      Page.new(path: :root_bottom, title: 'トップページ(下部)', within: :root),
      Page.new(path: :report, title: '若竹だより'),
      Page.new(path: :reunion, title: '創立100特集'),
      Page.new(path: :info, title: '事務局からのお知らせ'),
      Page.new(path: :photo_album, title: 'フォト<br>アルバム'),
      Page.new(path: :song, title: '校歌'),
      Page.new(path: :magazine, title: '会報「若竹」'),
      Page.new(path: :anniv_mag, title: '富士高編集<br>記念誌'),
      Page.new(path: :about_us, title: '若竹会について'),
      Page.new(path: :kaisoku, title: '会則', parent: :about_us),
      Page.new(path: :fusoku, title: '附則', parent: :about_us),
      Page.new(path: :meibo, title: '役員名簿', parent: :about_us),
      Page.new(path: :history, title: '沿革', parent: :about_us),
      Page.new(path: :link, title: 'リンク集'),
      Page.new(path: :register, title: 'メールアドレス登録フォーム'),
      Page.new(path: :form, title: '事務局への<br>連絡フォーム'),
      Page.new(path: :ucontact, title: '会員連絡先変更届'),
      Page.new(path: :archive, title: 'アーカイブ'),
      Page.new(path: :greeting, title: 'HP開設にあたり', parent: :archive),
      Page.new(path: :letter, title: '役員会だより', parent: :archive),
      Page.new(path: :whats_new, title: "更新履歴<br>(What's New)", parent: :archive),
    ]
  end

  def self.for_sidebar
    all.reject { |page| page.within.present? }
  end
end
