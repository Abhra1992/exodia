module ContestsHelper
  def contest_class(contest)
    if contest.in? @participating
      participating = 'participating'
    end
    disabled = 'disabled' if false
    [participating, disabled].compact.join(' ')
  end
end
