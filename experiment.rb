require "logger"
require "minitest/autorun"
require "pry"

def gl
  @logger ||= Logger.new(STDOUT)
end

binding.pry if ENV["PRY"]

class Experiment
  def ll
    @logger ||= Logger.new(STDOUT)
  end

  def start
    binding.pry
  end
end

console = Experiment.new

console.start if ENV["PRY"]

class ExperimentTest < Minitest::Test
  def test_gl
    assert_equal gl.object_id, gl.object_id
  end

  def test_console_gl
    console = Experiment.new
    refute_equal gl.object_id, console.send(:gl).object_id
    assert_equal console.send(:gl).object_id, console.send(:gl).object_id
  end

  def test_console_ll
    console = Experiment.new
    assert_equal console.ll.object_id, console.ll.object_id
    assert_equal console.ll.object_id, console.send(:gl).object_id
    refute_equal console.ll.object_id, gl.object_id
  end
end
