# General Application Utility Module

require 'enumerator'

module Utils
  
  # Functional programming utils
  def partition(arr, n)
    arr.enum_for(:each_slice, n).to_a
  end
end