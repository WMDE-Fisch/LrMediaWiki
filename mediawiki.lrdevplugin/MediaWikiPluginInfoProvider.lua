-- This file is part of the LrMediaWiki project and distributed under the terms
-- of the MIT license (see LICENSE.txt file in the project root directory or
-- [0]).  See [1] for more information about LrMediaWiki.
--
-- Copyright (C) 2015 by the LrMediaWiki team (see CREDITS.txt file in the
-- project root directory or [2])
--
-- [0]  <https://raw.githubusercontent.com/robinkrahl/LrMediaWiki/master/LICENSE.txt>
-- [1]  <https://commons.wikimedia.org/wiki/Commons:LrMediaWiki>
-- [2]  <https://raw.githubusercontent.com/robinkrahl/LrMediaWiki/master/CREDITS.txt>

-- Code status:
-- doc:   missing
-- i18n:  complete

local LrView = import 'LrView'

local MediaWikiUtils = require 'MediaWikiUtils'

local bind = LrView.bind
local prefs = import 'LrPrefs'.prefsForPlugin()

local MediaWikiPluginInfoProvider = {}

MediaWikiPluginInfoProvider.startDialog = function(propertyTable)
  propertyTable.logging = prefs.logging or false
end

MediaWikiPluginInfoProvider.endDialog = function(propertyTable)
  prefs.logging = propertyTable.logging
  MediaWikiUtils.setLogging(prefs.logging)
end

MediaWikiPluginInfoProvider.sectionsForBottomOfDialog = function(viewFactory, propertyTable)
	local labelAlignment = 'right';
	local widthLong = 50;

	return {
		{
			title = LOC '$$$/LrMediaWiki/Section/Config/Title=Configuration',
      bind_to_object = propertyTable,

			viewFactory:column {
				spacing = viewFactory:control_spacing(),

				viewFactory:row {
					spacing = viewFactory:label_spacing(),

					viewFactory:static_text {
						alignment = labelAlignment,
						width = LrView.share "label_width",
					},

					viewFactory:checkbox {
						value = bind 'logging',
            title = LOC '$$$/LrMediaWiki/Section/Config/Logging=Enable logging',
					},
				},

				viewFactory:row {
					spacing = viewFactory:label_spacing(),

					viewFactory:static_text {
						alignment = labelAlignment,
						width = LrView.share "label_width",
					},

					viewFactory:static_text {
            title = LOC '$$$/LrMediaWiki/Section/Config/Logging/Description=If you enable logging, all API requests are logged. The log file is located in your "My Documents" directory.',
            wrap = true,
					},
				},

				viewFactory:row {
					spacing = viewFactory:label_spacing(),

					viewFactory:static_text {
						alignment = labelAlignment,
						width = LrView.share "label_width",
					},

					viewFactory:static_text {
            title = LOC '$$$/LrMediaWiki/Section/Config/Logging/Warning=Warning:',
            font = '<system/bold>',
					},

					viewFactory:static_text {
            title = LOC '$$$/LrMediaWiki/Section/Config/Logging/Password=The log file contains your password!:',
					},
				},
      },
    },
  }
end

return MediaWikiPluginInfoProvider