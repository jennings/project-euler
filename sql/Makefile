.PHONY: help
help:
	@echo 'Run "make 1" to execute problem #1.'

%:
	sqlite3 -column -header ':memory:' < $(shell printf '%03d' $@).sql
