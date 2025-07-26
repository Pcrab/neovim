PLUGIN_DIR = ~/.config/nvim/pack/plugins/start

.PHONY: help install list add remove update

help:
	@echo "Neovim Plugin Management with Git Submodules"
	@echo "Usage:"
	@echo "  make install                     # Initialize all plugins"
	@echo "  make add <url>                   # Add a plugin from Git URL"
	@echo "  make remove <name>               # Remove a plugin by name"
	@echo "  make update                      # Update all plugins"
	@echo "  make update <name>               # Update a specific plugin"
	@echo "  make list                        # List all installed plugins"

install:
	@git submodule update --init --recursive
	@echo "✅ Plugins initialized"

list:
	@echo "📦 Installed plugins:"
	@grep path .gitmodules | awk '{print $$3}' | sed 's|$(PLUGIN_DIR)/||'

add:
	@URL=$(word 2, $(MAKECMDGOALS)); \
	if [ -z "$$URL" ]; then \
		echo "❌ Usage: make add <url>"; \
		exit 1; \
	fi; \
	NAME=$$(basename $$URL .git); \
	TARGET=$(PLUGIN_DIR)/$$NAME; \
	echo "➕ Adding plugin $$NAME from $$URL..."; \
	git submodule add $$URL $$TARGET; \
	git commit -am "Add plugin: $$NAME"; \
	echo "✅ Plugin $$NAME added."

remove:
	@NAME=$(word 2, $(MAKECMDGOALS)); \
	if [ -z "$$NAME" ]; then \
		echo "❌ Usage: make remove <name>"; \
		exit 1; \
	fi; \
	echo "🗑 Removing plugin $$NAME..."; \
	git submodule deinit -f $(PLUGIN_DIR)/$$NAME; \
	git rm -f $(PLUGIN_DIR)/$$NAME; \
	rm -rf .git/modules/$(PLUGIN_DIR)/$$NAME; \
	git commit -am "Remove plugin: $$NAME"; \
	echo "✅ Plugin $$NAME removed"

update:
	@NAME=$(word 2, $(MAKECMDGOALS)); \
	if [ -z "$$NAME" ]; then \
		echo "🔄 Updating all plugins..."; \
		git submodule update --remote --merge; \
		echo "✅ All plugins updated"; \
	else \
		echo "🔄 Updating plugin $$NAME..."; \
		cd $(PLUGIN_DIR)/$$NAME && git fetch origin && git checkout origin/HEAD; \
		cd - >/dev/null; \
		git add $(PLUGIN_DIR)/$$NAME; \
		git commit -m "Update plugin: $$NAME"; \
		echo "✅ Plugin $$NAME updated"; \
	fi

# Dummy target to avoid "No rule to make target" errors when using positional args
%:
	@:
