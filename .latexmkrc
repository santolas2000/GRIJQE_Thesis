$pdf_mode = 4;
$postscript_mode = $dvi_mode = 0;

$dependents_list = 0;
$dependents_file = 'build/dependencies';

# https://tex.stackexchange.com/questions/706447/why-am-i-getting-a-3-is-a-bad-bad-error
# $ENV{max_print_line} = $log_wrap = 2147483647;
$ENV{max_print_line} = $log_wrap = 19999;

@default_files = ('main');
$out_dir = 'build';

$preview_continuous_mode = 1;
$pdf_previewer = 'start xdg-open %O %S';

set_tex_cmds('-shell-escape -interaction nonstopmode %O %S | texlogsieve');

# Set up the filter
$TeX_log_processor = 'texlogsieve';
$TeX_log_filter = 'default';
