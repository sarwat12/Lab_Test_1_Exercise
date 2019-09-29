note
	description: "container application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_CONTAINER

inherit
	ES_TEST

create
	make

feature {NONE} -- Initialization

	make
			-- Add tests.
		do
			 add_boolean_case (agent test_array)
			 add_violation_case_with_tag ("s_not_empty", agent test_insert_first_array)
			 add_boolean_case (agent test_linked_list)
			 add_violation_case_with_tag ("s_not_empty", agent test_insert_first_linked_list)

			show_browser
			run_espec
		end

feature -- Tests

	test_array: BOOLEAN
		local
			ac: ARRAYED_CONTAINER
		do
			comment("Testing the ARRAYED_CONTAINER class")
			create ac.make
			Result := ac.count = 0
			check Result end

		    ac.insert_first ("A")
		    Result := ac.count = 1 and ac.get_at (0) ~ "A"
		    check Result end

		    ac.insert_first ("B")
		    ac.insert_first ("C")
		    Result := ac.count = 3 and ac.get_at (0) ~ "C" and ac.get_at (1) ~ "B" and ac.get_at (2) ~ "A"
		    check Result end

			ac.circular_shift_to_left
			Result := ac.count = 3 and ac.get_at (0) ~ "B" and ac.get_at (1) ~ "A" and ac.get_at (2) ~ "C"
			check Result end

			Result := ac.valid_index (0) and ac.valid_index (1) and ac.valid_index (2) and not ac.valid_index (3)
			check Result end
		end

		test_insert_first_array
		local
			ac: ARRAYED_CONTAINER
		do
			comment("Checking empty string in ARRAYED_CONTAINER class")
			create ac.make
			ac.insert_first("")
		end


		test_linked_list: BOOLEAN
		local
			ac: ARRAYED_CONTAINER
		do
			comment("Testing the LINKED_LIST_CONTAINER class")
			create ac.make
			Result := ac.count = 0
			check Result end

		    ac.insert_first ("A")
		    Result := ac.count = 1 and ac.get_at (0) ~ "A"
		    check Result end

		    ac.insert_first ("B")
		    ac.insert_first ("C")
		    Result := ac.count = 3 and ac.get_at (0) ~ "C" and ac.get_at (1) ~ "B" and ac.get_at (2) ~ "A"
		    check Result end

			ac.circular_shift_to_left
			Result := ac.count = 3 and ac.get_at (0) ~ "B" and ac.get_at (1) ~ "A" and ac.get_at (2) ~ "C"
			check Result end

			Result := ac.valid_index (0) and ac.valid_index (1) and ac.valid_index (2) and not ac.valid_index (3)
			check Result end
		end

		test_insert_first_linked_list
		local
			ac: LINKED_LIST_CONTAINER
		do
			comment("Checking empty string in LINKED_LIST_CONTAINER class")
			create ac.make
			ac.insert_first("")
		end
end
