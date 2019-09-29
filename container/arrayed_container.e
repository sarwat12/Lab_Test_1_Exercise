note
	description: "EECS3311 Lab Test 1 Exercise"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ARRAYED_CONTAINER

create
	make

feature {NONE} -- Implementation attribute
	-- Once you complete the current version where `imp` is an array,
	-- duplicate the starter project and change it to `imp: LINKED_LIST[STRING]`.
	-- Then complete the alternative version so you can also practice the use of a linked list.
	imp: ARRAY[STRING]

feature -- Public Attributes
	count: INTEGER -- You must keep this as an attribute.

feature -- Constructor
	make
			-- Initialize an empty container.
		do
			create imp.make_empty
		ensure
			empty_container: True -- Your Task
		end

feature -- Commands

	circular_shift_to_left
			-- Circularly shift all items to the left by one position.
		do
			-- Your Task
		ensure
			size_unchanged: True -- Your Task
			items_shifted: True -- Your Task
		end

	insert_first (s: STRING)
			-- Insert 's' as the first item in the container.
		require
			s_not_empty: True -- Your Task
		do
			-- Your Task
		ensure
			size_incremented: True -- Your Task
			first_inserted: True -- Your Task
			others_unchanged: True -- Your Task
		end


feature -- Query

	valid_index (i: INTEGER): BOOLEAN
			-- Is 'i' a valid index of the container?
		do
			-- Your Task
		ensure
			result_correct: True -- Your Task
			nothing_changed: True -- Your Task
		end

	get_at (i: INTEGER): STRING
		require
			valid_index: True -- Your Task
		do
			-- Your Task (delete the line below if necessary)
			Result := ""
		ensure
			result_correct: True -- Your Task
			nothing_changed: True -- Your Task
		end

invariant
    -- Do not remove this invariant.
	consistent_counts: imp.count = count
	no_rebase: imp.lower = 1
end
