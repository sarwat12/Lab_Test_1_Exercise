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
--	 Once you complete the current version where `imp` is an array,
--	 duplicate the starter project and change it to `imp: LINKED_LIST[STRING]`.
--	 Then complete the alternative version so you can also practice the use of a linked list.
	imp: LINKED_LIST[STRING]

feature -- Public Attributes
	count: INTEGER -- You must keep this as an attribute.

feature -- Constructor
	make
			 --Initialize an empty container.
		do
			create imp.make
			count := 0
		ensure
			empty_container: count = 0 -- Your Task
		end

feature -- Commands

	circular_shift_to_left
			 --Circularly shift all items to the left by one position.
		local
			temp: STRING
		do
			 --Your Task
			temp := imp.i_th (1)
            across 2 |..| imp.count is i loop
            	imp.put_i_th (imp.i_th (i), i - 1)
            end
            imp.put_i_th (temp, imp.count)
		ensure
			size_unchanged: count = old count -- Your Task
			items_shifted:  across 1 |..| imp.count is i all
				((i /= imp.count implies imp.i_th (i) ~ (old imp.deep_twin).i_th (i + 1)) and i = imp.count implies imp.i_th (i) ~ (old imp.deep_twin).i_th (1)) end-- Your Task
		end

	insert_first (s: STRING)
			-- Insert 's' as the first item in the container.
		require
			s_not_empty: not s.is_empty -- Your Task
		do
			 --Your Task
			count := count + 1
			imp.put_front (s)
		ensure
			size_incremented: count = old count + 1 -- Your Task
			first_inserted:  imp.i_th (1) ~ s-- Your Task
			others_unchanged:  across 2 |..| imp.count is i all imp.i_th (i) ~ (old imp.deep_twin).i_th (i - 1) end-- Your Task
		end


feature -- Query

	valid_index (i: INTEGER): BOOLEAN
			-- Is 'i' a valid index of the container?
		do
			 -- Your Task
			Result := i >= 0 and i <= count - 1
		ensure
			result_correct: Result = (i >= 0 and i <= count - 1) -- Your Task
			nothing_changed: across 1 |..| imp.count is j all imp.i_th (j) ~ (old imp.deep_twin).i_th (j) end -- Your Task
		end

	get_at (i: INTEGER): STRING
		require
			valid_index: valid_index (i) -- Your Task
		do
			 -- Your Task (delete the line below if necessary)
			Result := imp.i_th (i + 1)
		ensure
			result_correct: Result = imp.i_th (i + 1) -- Your Task
			nothing_changed: across 1 |..| imp.count is j all imp.i_th (j) ~ (old imp.deep_twin).i_th (j) end -- Your Task
		end

invariant
     --Do not remove this invariant.
	consistent_counts: imp.count = count
	no_rebase: imp.lower = 1
end
