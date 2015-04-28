require_relative 'test_base'
class TestArticle < TestBase
  def setup
    @article = Article.new(:title=>"title",:content=>"name")
  end
  def test_article_save
    @article.save
    assert_equal @article.title,'title'
  end

  def teardown
    @article.delete
  end
end
