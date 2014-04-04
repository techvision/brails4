module LevelHelper

  def aria_owns_ids(levels)
    level_row_count = levels.in_groups_of(3).count
    (1..level_row_count).collect{|d| "row_#{d}"}.join(' ')
  end

  def cell_ids(cells)
    cells.each_with_index.map{|c, index| "cell_#{c.seq_number}" if c}.join(' ')
  end
end
