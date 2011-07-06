class bash::timeout {
    include bash
    case $operatingsystem{
      debian: { include bash::timeout::debian }
      default: { include bash::timeout::base }
    }
}
