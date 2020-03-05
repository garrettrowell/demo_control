plan task_demo::cowsay_plan(
  Boolean $cleanup = false,
  Optional[String[1]] $message,
){
  $nodes = get_target('pe-201922-agent.puppetdebug.vlan')

  if $cleanup {
    run_task('package', $nodes, action => uninstall, name => 'epel-release')
    run_task('package', $nodes, action => uninstall, name => 'cowsay')
    run_task('package', $nodes, action => uninstall, name => 'fortune-mod')
  } else {
    run_task('package', $nodes, action => install, name => 'epel-release')
    run_task('package', $nodes, action => install, name => 'cowsay')
    run_task('package', $nodes, action => install, name => 'fortune-mod')
  }

  if $message == undef {
    run_command('fortune | cowsay', $nodes)
  } else {
    run_command("cowsay ${message}", $nodes)
  }

}
