require "logger"
require "minitest/autorun"
require "pry"

def gl
  @gl ||= Logger.new(STDOUT)
end

binding.pry if ENV["PRY"]

class Experiment
  def ll
    @ll ||= Logger.new(STDOUT)
  end

  def start
    binding.pry
  end
end

console = Experiment.new

console.start if ENV["PRY"]

class ExperimentTest < Minitest::Test
  def test_gl
    assert_equal gl, gl
  end

  def test_console_gl
    console = Experiment.new
    refute_equal gl, console.send(:gl)
    assert_equal console.send(:gl), console.send(:gl)
  end

  def test_console_ll
    console = Experiment.new
    assert_equal console.ll, console.ll
    refute_equal console.ll, console.send(:gl)
  end
end
