note
	description: "Summary description for {LINKED_LIST_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LINKED_LIST_CONTAINER

create
	make

feature {NONE} -- Implementation attribute
	-- Once you complete the current version where `imp` is an array,
	-- duplicate the starter project and change it to `imp: LINKED_LIST[STRING]`.
	-- Then complete the alternative version so you can also practice the use of a linked list.
	imp: LINKED_LIST[STRING]

feature -- Public Attributes
	count: INTEGER -- You must keep this as an attribute.

feature -- Constructor
	make
			-- Initialize an empty container.
		do
			create imp.make_empty
			count := 0
		ensure
			empty_container: count = 0 -- Your Task
		end

feature -- Commands

	circular_shift_to_left
			-- Circularly shift all items to the left by one position.
		local
			temp: STRING
		do
			-- Your Task
            temp := imp[1]
            across 2 |..| imp.count is i loop
            	imp[i - 1] := imp[i]
            end
            imp[imp.count] := temp
		ensure
			size_unchanged: count = old count -- Your Task
			items_shifted: across 1 |..| imp.count is i all
				((i /= imp.count implies imp[i] ~ (old imp.deep_twin)[i + 1]) and i = imp.count implies imp[i] ~ (old imp.deep_twin)[1]) end -- Your Task
		end

	insert_first (s: STRING)
			-- Insert 's' as the first item in the container.
		require
			s_not_empty: not s.is_empty -- Your Task
		local
		j:INTEGER
		do
			-- Your Task
			count := count + 1

			if not imp.is_empty then
				from
					j := imp.upper
				until
					j < imp.lower
				loop
					imp.force (imp[j], j + 1)
					j := j - 1
				end
				imp.force (s, 1)
			else
				imp.force (s, 1)
			end
		ensure
			size_incremented: count = old count + 1 -- Your Task
			first_inserted: imp[1] ~ s -- Your Task
			others_unchanged: across 2 |..| imp.count is i all imp[i] ~ (old imp.deep_twin)[i - 1] end -- Your Task
		end


feature -- Query

	valid_index (i: INTEGER): BOOLEAN
			-- Is 'i' a valid index of the container?
		do
			-- Your Task
			Result := i >= 0 and i <= count - 1
		ensure
			result_correct: Result = (i >= 0 and i <= count - 1) -- Your Task
			nothing_changed: across 1 |..| imp.count is j all imp[j] ~ (old imp.deep_twin)[j] end -- Your Task
		end

	get_at (i: INTEGER): STRING
		require
			valid_index: valid_index (i) -- Your Task
		do
			-- Your Task (delete the line below if necessary)
			Result := imp[i + 1]
		ensure
			result_correct: Result = imp[i + 1] -- Your Task
			nothing_changed: across 1 |..| imp.count is j all imp[j] ~ (old imp.deep_twin)[j] end -- Your Task
		end

invariant
    -- Do not remove this invariant.
	consistent_counts: imp.count = count
	no_rebase: imp.lower = 1
end
