plan task_demo::cowsay_plan(){
  $nodes = get_targets([‘pe-201922-agent.puppetdebug.vlan’,])
  run_command(‘whoami’, $nodes)
}
