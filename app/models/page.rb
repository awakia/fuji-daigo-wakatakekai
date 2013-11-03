class Page
  attr_accessor :path, :title, :parent

  def initialize(path: path, title: title, parent: parent)
    @path = path
    @title = title
    @parent = parent
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
    self.all.find { |x| x.path == path }
  end

  def self.all
    @@all ||= [
      Page.new(path: :root, title: 'トップページ'),
      Page.new(path: :greeting, title: 'HP開設にあたり'),
      Page.new(path: :about_us, title: '若竹会について'),
      Page.new(path: :kaisoku, title: '会則', parent: :about_us),
      Page.new(path: :fusoku, title: '附則', parent: :about_us),
      Page.new(path: :meibo, title: '役員名簿', parent: :about_us),
      Page.new(path: :history, title: '沿革', parent: :about_us),
      Page.new(path: :letter, title: '役員会だより'),
      Page.new(path: :info, title: '事務局からのお知らせ'),
      Page.new(path: :w_new, title: "更新履歴<br>(What's New)"),
      Page.new(path: :archive, title: 'アーカイブ'),
      Page.new(path: :magazine, title: '会報「若竹」', parent: :archive),
      Page.new(path: :anniv_mag, title: '富士高編集<br>記念誌', parent: :archive),
      Page.new(path: :song, title: '校歌', parent: :archive),
      Page.new(path: :photo_album, title: 'フォト<br>アルバム', parent: :archive),
      Page.new(path: :form, title: '事務局への<br>連絡フォーム'),
      Page.new(path: :ucontact, title: '会員連絡先変更届'),
    ]
  end
end
