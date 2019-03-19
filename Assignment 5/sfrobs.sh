#! /bin/bash

# make sure the order of sort is standard
export LC_ALL='C'

# oct form of ascii
decoded="\0\1\2\3\4\5\6\7\10\11\12\13\14\15\
\16\17\20\21\22\23\24\25\26\27\30\31\32\
\33\34\35\36\37\40\41\42\43\44\45\46\47\50\
\51\52\53\54\55\56\57\60\61\62\63\64\
\65\66\67\70\71\72\73\74\75\76\77\100\101\
\102\103\104\105\106\107\110\111\112\113\114\115\116\
\117\120\121\122\123\124\125\126\127\130\131\132\133\
\134\135\136\137\140\141\142\143\144\145\146\147\150\
\151\152\153\154\155\156\157\160\161\162\163\164\165\
\166\167\170\171\172\173\174\175\176\177\200\201\202\
\203\204\205\206\207\210\211\212\213\214\215\216\217\
\220\221\222\223\224\225\226\227\230\231\232\233\234\
\235\236\237\240\241\242\243\244\245\246\247\250\251\
\252\253\254\255\256\257\260\261\262\263\264\265\266\
\267\270\271\272\273\274\275\276\277\300\301\302\303\
\304\305\306\307\310\311\312\313\314\315\316\317\320\
\321\322\323\324\325\326\327\330\331\332\333\334\335\
\336\337\340\341\342\343\344\345\346\347\350\351\352\
\353\354\355\356\357\360\361\362\363\364\365\366\367\
\370\371\372\373\374\375\376\377"

# oct form of ascii after XOR 42
encoded="\52\53\50\51\56\57\54\55\42\43\40\41\46\47\44\
\45\72\73\70\71\76\77\74\75\62\63\60\
\61\66\67\64\65\12\13\10\11\16\17\14\
\15\2\3\0\1\6\7\4\5\32\33\30\31\36\
\37\34\35\22\23\20\21\26\27\24\25\152\153\
\150\151\156\157\154\155\142\143\140\141\146\147\144\
\145\172\173\170\171\176\177\174\175\162\163\160\161\
\166\167\164\165\112\113\110\111\116\117\114\115\102\
\103\100\101\106\107\104\105\132\133\130\131\136\137\
\134\135\122\123\120\121\126\127\124\125\252\253\250\
\251\256\257\254\255\242\243\240\241\246\247\244\245\
\272\273\270\271\276\277\274\275\262\263\260\261\266\
\267\264\265\212\213\210\211\216\217\214\215\202\203\
\200\201\206\207\204\205\232\233\230\231\236\237\234\
\235\222\223\220\221\226\227\224\225\352\353\350\351\
\356\357\354\355\342\343\340\341\346\347\344\345\372\
\373\370\371\376\377\374\375\362\363\360\361\366\367\
\364\365\312\313\310\311\316\317\314\315\302\303\300\
\301\306\307\304\305\332\333\330\331\336\337\334\335\
\322\323\320\321\326\327\324\325"


if [ "$#" -gt 1 ]; then
	echo "Extra operands"
elif [ "$#" -eq 1 ]; then
	# one option
	if [ "$1" == "-f" ]; then
		# -f option
		tr "$encoded" "$decoded" | sort -f | tr "$decoded" "$encoded" 
	else
		# invalud option
		echo "Invalid option"
	fi
else
	# no option
	tr "$encoded" "$decoded" | sort | tr "$decoded" "$encoded"
fi