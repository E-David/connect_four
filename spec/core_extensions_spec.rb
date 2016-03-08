require "spec_helper.rb" 

describe Array do

	context "#all_full?" do
		it { expect(["a","b","c"].all_full?).to be_truthy }
		it { expect(["a","","c"].all_full?).to be_falsey }
		it { expect(["","",""].all_full?).to be_falsey }
	end

	context "#match_four?" do
		it { expect(["a","b","b","b","b","f"].match_four?).to be_truthy }
		it { expect(["a","b","c","d","e"].match_four?).to be_falsey }
		it { expect(["b","b","c","b","b"].match_four?).to be_falsey }
		it { expect(["","","","",""].match_four?).to be_falsey }
	end

	context "#merge_horizontally" do
		it "merges all rows in a grid into one searchable array" do
			horizontals = [["1","2","3"],
						   ["4","5","6"],
						   ["7","8","9"]].merge_horizontally

			expect(horizontals).to include(["1","2","3"],
										   ["7","8","9"],
										   ["4","5","6"])
		end
	end

	context "#merge_vertically" do
		it "merges all columns in a grid into one searchable array" do
			verticals = [["a","b","c"],
						 ["a","b","c"],
						 ["a","b","c"]].merge_vertically

			expect(verticals).to include(["a","a","a"],
										 ["c","c","c"],
										 ["b","b","b"])
		end
	end

	context "#merge_diagonally" do
		it "merges all diagonals in a grid into one searchable array" do
			diagonals = [["a","b","c","d","e"],
						 ["a","b","c","d","e"],
						 ["a","b","c","d","e"],
						 ["a","b","c","d","e"]].merge_diagonally

			expect(diagonals).to include(["a","b","c","d"],
									     ["b","c","d","e"],
										 ["e","d","c","b"],
										 ["d","c","b","a"])
		end
	end
end