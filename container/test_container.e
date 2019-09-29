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
			 add_boolean_case (agent test)
			-- add_violation_case_with_tag (agent test_insert_first)

			show_browser
			run_espec
		end

feature -- Tests

	test: BOOLEAN
		local
			ac: ARRAYED_CONTAINER
		do
			Result := true
		end

end
