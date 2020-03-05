plan task_demo::cowsay_plan(){
  $nodes = get_target('pe-201922-agent.puppetdebug.vlan')
  run_command('whoami', $nodes)
}
