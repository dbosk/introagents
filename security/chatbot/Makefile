# The rules are tangled from chatbot.nw (section "Building the bot")
# into chatbot.mk; GNU make remakes that file when chatbot.nw changes
# and then restarts with the new rules.
.DEFAULT_GOAL:=	all
chatbot.mk: chatbot.nw
	notangle -t8 -R"[[chatbot.mk]]" $< > $@
include chatbot.mk
