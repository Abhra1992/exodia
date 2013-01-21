module ContestsHelper
  def contest_class(contest)
    participating = 'participating' if @participating.include? contest
    disabled = 'disabled' if false
    [participating, disabled].compact.join(' ')
  end
end
