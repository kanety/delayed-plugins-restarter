require 'spec_helper'
require 'active_record_helper'
require 'delayed_job_active_record'


describe Delayed::Plugins::Restarter do
  before do
    Delayed::Job.delete_all
    5.times { Array.new.delay.pop }
  end

  let(:plugin) {
    Delayed::Plugins::Restarter
  }

  let(:worker) do
    Delayed::Worker.new
  end

  it 'has a version number' do
    expect(plugin::VERSION).not_to be nil
  end

  it 'has a max_memory config' do
    plugin.max_memory = 1
    expect(plugin.max_memory).to eq(1)
  end


  it 'runs memory check' do
    plugin.max_memory = 100*(1024**2)
    worker.work_off
    expect(plugin.last_memory).not_to be nil
  end

  it 'stops a worker if its memory has been exeeded' do
    plugin.max_memory = 1
    expect(worker.stop?).to eq(false)
    worker.work_off
    expect(worker.stop?).to eq(true)
  end
end
