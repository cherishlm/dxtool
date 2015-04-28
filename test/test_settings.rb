require_relative 'test_base'
class TestSettings < TestBase
  def setup
    @setting= Setting.new(:key=>"title",:value=>"IT烟台")
  end
  def test_setting_save
    @setting.save
    assert_equal @setting.value,'IT烟台'
  end
  def teardown
    @setting.delete
  end
end
