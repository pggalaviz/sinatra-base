worker_processes (ENV['UNICORN_WORKERS'] || 3).to_i
timeout (ENV['UNICORN_TIMEOUT'] || 5).to_i
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM, wait for master to send QUIT'
  end
end
