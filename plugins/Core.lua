local function MaTaDoRTeaM(msg, mr_roo)
	if tonumber(msg.from.id) == SUDO then
		if mr_roo[1]:lower() == "setsudo" or mr_roo[1] == "اضف مطور" then
			AddandRem(msg, mr_roo[2] ,"visudo")
		elseif mr_roo[1]:lower() == "remsudo" or mr_roo[1] == "حذف مطور" then
			AddandRem(msg, mr_roo[2] ,"desudo")
		end
	end
	if is_sudo(msg) then
		if mr_roo[1]:lower() == "setadmin" or mr_roo[1] == "رفع ادمن" then
			AddandRem(msg, mr_roo[2] ,"adminprom")
		elseif mr_roo[1]:lower() == "remadmin" or mr_roo[1] == "تنزيل ادمن" then
			AddandRem(msg, mr_roo[2] ,"admindem")
		elseif mr_roo[1]:lower() == "add" or mr_roo[1] == "تفعيل" then
			return modadd(msg)
		elseif mr_roo[1]:lower() == "rem" or mr_roo[1] == "تعطيل" then
			return modrem(msg)
		end
	end
	if is_admin(msg) then
		if mr_roo[1]:lower() == "gbanlist" or mr_roo[1] == "قائمه العام" then
			return gbanned_list(msg)
		elseif mr_roo[1]:lower() == "banall" or mr_roo[1] == "حظر عام" then
			AddandRem(msg, mr_roo[2] ,"banall")
		elseif mr_roo[1]:lower() == "unbanall" or mr_roo[1] == "الغاء العام" then
			AddandRem(msg, mr_roo[2] ,"unbanall")
		elseif mr_roo[1]:lower() == "setowner" or mr_roo[1] == 'رفع منشئ' then
			AddandRem(msg, mr_roo[2] ,"setowner")
		elseif mr_roo[1]:lower() == "remowner" or mr_roo[1] == "تنزيل منشئ" then
			AddandRem(msg, mr_roo[2] ,"remowner")
		end
	end
	if is_JoinChannel(msg) then
		if is_owner(msg) then
			if mr_roo[1]:lower() == "promote" or mr_roo[1] == "رفع مدير" then
				AddandRem(msg, mr_roo[2] ,"promote")
			elseif mr_roo[1]:lower() == "ownerlist" or mr_roo[1] == "المنشئين" then
				return ownerlist(msg)
			elseif mr_roo[1]:lower() == "demote" or mr_roo[1] == "تنزيل مدير" then
				AddandRem(msg, mr_roo[2] ,"demote")
			end
		end
		if is_mod(msg) then
			if msg.to.type ~= 'pv' then
				if mr_roo[1]:lower() == "silentlist" or mr_roo[1] == "قائمه الصامت" then
					return silent_users_list(msg)
				elseif mr_roo[1]:lower() == "banlist" or mr_roo[1] == "المحظورين" then
					return banned_list(msg)
				elseif mr_roo[1]:lower() == "kick" or mr_roo[1] == "طرد" then
					AddandRem(msg, mr_roo[2] ,"kick")
				elseif mr_roo[1]:lower() == "delall" or mr_roo[1] == "مسح الكل" then
					AddandRem(msg, mr_roo[2] ,"delall")
				elseif mr_roo[1]:lower() == "ban" or mr_roo[1] == "حظر" then
					AddandRem(msg, mr_roo[2] ,"ban")
				elseif mr_roo[1]:lower() == "unban" or mr_roo[1] == "الغاء الحظر" then
					AddandRem(msg, mr_roo[2] ,"unban")
				elseif mr_roo[1]:lower() == "silent" or mr_roo[1] == "تصميت" then
					AddandRem(msg, mr_roo[2] ,"silent")
				elseif mr_roo[1]:lower() == "unsilent" or mr_roo[1] == "الغاء تصميت" then
					AddandRem(msg, mr_roo[2] ,"unsilent")
				end
			end
			if (mr_roo[1]:lower() == "whitelist" or mr_roo[1] == "القائمه البيضاء") and mr_roo[2] == "+" then
				AddandRem(msg, mr_roo[3] ,"setwhitelist")
			elseif (mr_roo[1]:lower() == "whitelist" or mr_roo[1] == "القائمه البيضاء") and mr_roo[2] == "-" then
				AddandRem(msg, mr_roo[3] ,"remwhitelist")
			elseif (mr_roo[1]:lower() == "whitelist" or mr_roo[1] == "القائمه البيضاء") and not mr_roo[2] then
				return whitelist(msg)
			elseif mr_roo[1]:lower() == "modlist" or mr_roo[1] == "المدراء" then
				return modlist(msg)
			elseif mr_roo[1]:lower() == 'filter' or mr_roo[1] == "منع" then
				return filter_word(msg, mr_roo[2])
			elseif mr_roo[1]:lower() == 'unfilter' or mr_roo[1] == "الغاء منع"  then
				return unfilter_word(msg, mr_roo[2])
			elseif mr_roo[1]:lower() == 'filterlist' or mr_roo[1] == "قائمه المنع" then
				return filter_list(msg)
			elseif mr_roo[1]:lower() == "settings" or mr_roo[1] == "اعدادات" then
				return group_settings(msg)
			elseif mr_roo[1]:lower() == "warn" or mr_roo[1] == "تحذير" then
				AddandRem(msg, mr_roo[2] ,"warn")
			elseif mr_roo[1]:lower() == "unwarn" or mr_roo[1] == "الغاء تحذير" then
				AddandRem(msg, mr_roo[2] ,"unwarn")
			end
		end
	end
end

return {
patterns = core_patterns, run = MaTaDoRTeaM, pre_process = Mr_Mine
}