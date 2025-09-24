#!/bin/bash

total_lines=$(wc -l < clean_dialog.csv)
total_lines=$((total_lines - 1))

twilight_lines=$(grep -i "twilight sparkle" clean_dialog.csv | wc -l)
rarity_lines=$(grep -i "rarity" clean_dialog.csv | wc -l)
pinkie_lines=$(grep -i "pinkie pie" clean_dialog.csv | wc -l)
rainbow_lines=$(grep -i "rainbow dash" clean_dialog.csv | wc -l)
fluttershy_lines=$(grep -i "fluttershy" clean_dialog.csv | wc -l)

twilight_percent=$(echo "scale=2; $twilight_lines * 100 / $total_lines" | bc)
rarity_percent=$(echo "scale=2; $rarity_lines * 100 / $total_lines" | bc)
pinkie_percent=$(echo "scale=2; $pinkie_lines * 100 / $total_lines" | bc)
rainbow_percent=$(echo "scale=2; $rainbow_lines * 100 / $total_lines" | bc)
fluttershy_percent=$(echo "scale=2; $fluttershy_lines * 100 / $total_lines" | bc)

cat > Line_percentages.csv << EOF
pony_name,total_line_count,percent_all_lines
Twilight Sparkle,$twilight_lines,$twilight_percent
Rarity,$rarity_lines,$rarity_percent
Pinkie Pie,$pinkie_lines,$pinkie_percent
Rainbow Dash,$rainbow_lines,$rainbow_percent
Fluttershy,$fluttershy_lines,$fluttershy_percent
EOF

cat Line_percentages.csv