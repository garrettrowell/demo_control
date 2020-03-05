plan task_demo::cowsay_plan(){
  $nodes = get_target('pe-201922-agent.puppetdebug.vlan')
  run_task('package', $nodes, action => install, name => 'epel-release')
  run_task('package', $nodes, action => install, name => 'cowsay')
  run_task('package', $nodes, action => install, name => 'fortune-mod')

}
