

### Useage

```ini
usage: marker_single [-h] [--max_pages MAX_PAGES] [--start_page START_PAGE] [--langs LANGS]
                     [--batch_multiplier BATCH_MULTIPLIER] [--debug] [--ocr_all_pages]
                     filename output

positional arguments:
  filename              PDF file to parse
  output                Output base folder path

options:
  -h, --help            show this help message and exit
  --max_pages MAX_PAGES
                        Maximum number of pages to parse
  --start_page START_PAGE
                        Page to start processing at
  --langs LANGS         Optional languages to use for OCR, comma separated
  --batch_multiplier BATCH_MULTIPLIER
                        How much to increase batch sizes
  --debug               Enable debug logging
  --ocr_all_pages       Force OCR on all pages
```



```ini
Usage: marker_single [OPTIONS] FPATH

  Convert a single PDF to markdown.

Options:
  --force_layout_block [Line|Span|FigureGroup|TableGroup|ListGroup|PictureGroup|Page|Caption|Code|Figure|Footnote|Form|Equation|Handwriting|TextInlineMath|ListItem|PageFooter|PageHeader|Picture|SectionHeader|Table|Text|TableOfContents|Document|ComplexRegion|TableCell|Reference]
  --converter_cls TEXT            Converter class to use.  Defaults to PDF
                                  converter.
  --use_llm                       Enable higher quality processing with LLMs.
  --google_api_key TEXT           Google API key for using LLMs.
  --languages TEXT                Comma separated list of languages to use for
                                  OCR.
  --page_range TEXT               Page range to convert, specify comma
                                  separated page numbers or ranges.  Example:
                                  0,5-10,20
  --disable_image_extraction      Disable image extraction.
  --disable_multiprocessing       Disable multiprocessing.
  --config_json TEXT              Path to JSON file with additional
                                  configuration.
  --processors TEXT               Comma separated list of processors to use.
                                  Must use full module path.
  --output_format [markdown|json|html]
                                  Format to output results in.
  -d, --debug                     Enable debug mode.
  --output_dir PATH               Directory to save output.
  --lowres_image_dpi INTEGER      DPI setting for low-resolution page images
                                  used for Layout and Line Detection. Default
                                  is 96. (Applies to: DocumentBuilder)
  --highres_image_dpi INTEGER     DPI setting for high-resolution page images
                                  used for OCR. Default is 192. (Applies to:
                                  DocumentBuilder)
  --disable_ocr                   Disable OCR processing. Default is False.
                                  (Applies to: DocumentBuilder)
  --batch_size OPTIONAL           The batch size to use for the layout model.
                                  Default is None, which will use the default
                                  batch size for the model. (Applies to:
                                  LayoutBuilder, LLMLayoutBuilder)
  --layout_coverage_min_lines INTEGER
                                  The minimum number of PdfProvider lines that
                                  must be covered by the layout model to
                                  consider the lines from the PdfProvider
                                  valid. Default is 1. (Applies to:
                                  LayoutBuilder, LLMLayoutBuilder)
  --layout_coverage_threshold FLOAT
                                  The minimum coverage ratio required for the
                                  layout model to consider the lines from the
                                  PdfProvider valid. Default is 0.1. (Applies
                                  to: LayoutBuilder, LLMLayoutBuilder)
  --document_ocr_threshold FLOAT  The minimum ratio of pages that must pass
                                  the layout coverage check to avoid OCR.
                                  Default is 0.8. (Applies to: LayoutBuilder,
                                  LLMLayoutBuilder)
  --force_layout_block TEXT       Skip layout and force every page to be
                                  treated as a specific block type. Default is
                                  None. (Applies to: LayoutBuilder,
                                  LLMLayoutBuilder)
  --recognition_batch_size OPTIONAL
                                  The batch size to use for the recognition
                                  model. Default is None, which will use the
                                  default batch size for the model. (Applies
                                  to: OcrBuilder, TableProcessor)
  --detection_batch_size OPTIONAL
                                  The batch size to use for the detection
                                  model. Default is None, which will use the
                                  default batch size for the model. (Applies
                                  to: OcrBuilder)
  --enable_table_ocr              Whether to skip OCR on tables.  The
                                  TableProcessor will re-OCR them.  Only
                                  enable if the TableProcessor is not running.
                                  Default is False. (Applies to: OcrBuilder)
  --google_api_key TEXT           The Google API key to use for the Gemini
                                  model. Default is . (Applies to:
                                  LLMLayoutBuilder, LLMComplexRegionProcessor,
                                  LLMEquationProcessor, LLMFormProcessor,
                                  LLMHandwritingProcessor,
                                  LLMImageDescriptionProcessor,
                                  LLMTableProcessor, LLMTableMergeProcessor,
                                  LLMTextProcessor)
  --confidence_threshold FLOAT    The confidence threshold to use for
                                  relabeling (anything below is relabeled).
                                  Default is 0.7. (Applies to:
                                  LLMLayoutBuilder)
  --picture_height_threshold FLOAT
                                  The height threshold for pictures that may
                                  actually be complex regions. (anything above
                                  this ratio against the page is relabeled)
                                  Default is 0.8. (Applies to:
                                  LLMLayoutBuilder)
  --model_name TEXT               The name of the Gemini model to use. Default
                                  is gemini-1.5-flash. (Applies to:
                                  LLMLayoutBuilder, LLMComplexRegionProcessor,
                                  LLMEquationProcessor, LLMFormProcessor,
                                  LLMHandwritingProcessor,
                                  LLMImageDescriptionProcessor,
                                  LLMTableProcessor, LLMTableMergeProcessor,
                                  LLMTextProcessor)
  --max_retries INTEGER           The maximum number of retries to use for the
                                  Gemini model. Default is 3. (Applies to:
                                  LLMLayoutBuilder, LLMComplexRegionProcessor,
                                  LLMEquationProcessor, LLMFormProcessor,
                                  LLMHandwritingProcessor,
                                  LLMImageDescriptionProcessor,
                                  LLMTableProcessor, LLMTableMergeProcessor,
                                  LLMTextProcessor)
  --max_concurrency INTEGER       The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
                                  (Applies to: LLMLayoutBuilder,
                                  LLMComplexRegionProcessor,
                                  LLMEquationProcessor, LLMFormProcessor,
                                  LLMHandwritingProcessor,
                                  LLMImageDescriptionProcessor,
                                  LLMTableProcessor, LLMTableMergeProcessor,
                                  LLMTextProcessor)
  --timeout INTEGER               The timeout for requests to the Gemini
                                  model. Default is 60. (Applies to:
                                  LLMLayoutBuilder, LLMComplexRegionProcessor,
                                  LLMEquationProcessor, LLMFormProcessor,
                                  LLMHandwritingProcessor,
                                  LLMImageDescriptionProcessor,
                                  LLMTableProcessor, LLMTableMergeProcessor,
                                  LLMTextProcessor)
  --topk_relabelling_prompt TEXT  The prompt to use for relabelling blocks.
                                  Default is a string containing the Gemini
                                  relabelling prompt. (Applies to:
                                  LLMLayoutBuilder)
  --complex_relabeling_prompt TEXT
                                  The prompt to use for complex relabelling
                                  blocks. Default is a string containing the
                                  complex relabelling prompt. (Applies to:
                                  LLMLayoutBuilder)
  --gap_threshold FLOAT           The minimum gap between blocks to consider
                                  them part of the same group. Default is
                                  0.05. (Applies to: StructureBuilder)
  --list_gap_threshold FLOAT      The minimum gap between list items to
                                  consider them part of the same group.
                                  Default is 0.1. (Applies to:
                                  StructureBuilder)
  --min_x_indent FLOAT            The minimum horizontal indentation required
                                  to consider a block as part of a blockquote.
                                  Expressed as a percentage of the block
                                  width. Default is 0.05. (Applies to:
                                  BlockquoteProcessor, ListProcessor)
  --x_start_tolerance FLOAT       The maximum allowable difference between the
                                  starting x-coordinates of consecutive blocks
                                  to consider them aligned. Expressed as a
                                  percentage of the block width. Default is
                                  0.01. (Applies to: BlockquoteProcessor)
  --x_end_tolerance FLOAT         The maximum allowable difference between the
                                  ending x-coordinates of consecutive blocks
                                  to consider them aligned. Expressed as a
                                  percentage of the block width. Default is
                                  0.01. (Applies to: BlockquoteProcessor)
  --debug_data_folder TEXT        The folder to dump debug data to. Default is
                                  debug_data. (Applies to: DebugProcessor)
  --debug_layout_images           Whether to dump layout debug images. Default
                                  is False. (Applies to: DebugProcessor)
  --debug_pdf_images              Whether to dump PDF debug images. Default is
                                  False. (Applies to: DebugProcessor)
  --debug_json                    Whether to dump block debug data. Default is
                                  False. (Applies to: DebugProcessor)
  --render_font TEXT              The path to the font to use for rendering
                                  debug images. Default is D:\Workspaces\pytho
                                  n_OCR\marker\static\fonts\GoNotoCurrent-
                                  Regular.ttf. (Applies to: DebugProcessor)
  --font_dl_path TEXT             The path to download the font from. Default
                                  is https://github.com/satbyy/go-noto-
                                  universal/releases/download/v7.0. (Applies
                                  to: DebugProcessor)
  --model_max_length INTEGER      The maximum number of tokens to allow for
                                  the Texify model. Default is 768. (Applies
                                  to: EquationProcessor)
  --texify_batch_size OPTIONAL    The batch size to use for the Texify model.
                                  Default is None, which will use the default
                                  batch size for the model. (Applies to:
                                  EquationProcessor)
  --token_buffer INTEGER          The number of tokens to buffer above max for
                                  the Texify model. Default is 256. (Applies
                                  to: EquationProcessor)
  --common_element_threshold FLOAT
                                  The minimum ratio of pages a text block must
                                  appear on to be considered a common element.
                                  Blocks that meet or exceed this threshold
                                  are marked as common elements. Default is
                                  0.2. (Applies to: IgnoreTextProcessor)
  --common_element_min_blocks INTEGER
                                  The minimum number of occurrences of a text
                                  block within a document to consider it a
                                  common element. This ensures that rare
                                  blocks are not mistakenly flagged. Default
                                  is 3. (Applies to: IgnoreTextProcessor)
  --max_streak INTEGER            The maximum number of consecutive
                                  occurrences of a text block allowed before
                                  it is classified as a common element. Helps
                                  to identify patterns like repeated headers
                                  or footers. Default is 3. (Applies to:
                                  IgnoreTextProcessor)
  --text_match_threshold INTEGER  The minimum fuzzy match score (0-100)
                                  required to classify a text block as similar
                                  to a common element. Higher values enforce
                                  stricter matching. Default is 90. (Applies
                                  to: IgnoreTextProcessor)
  --strip_numbers_threshold FLOAT
                                  The fraction of lines or tokens in a block
                                  that must be numeric to consider them as
                                  line numbers. Default is 0.6. (Applies to:
                                  LineNumbersProcessor)
  --min_lines_in_block INTEGER    The minimum number of lines required in a
                                  block for it to be considered during
                                  processing. Ensures that small blocks are
                                  ignored as they are unlikely to contain
                                  meaningful line numbers. Default is 4.
                                  (Applies to: LineNumbersProcessor)
  --min_line_length INTEGER       The minimum length of a line (in characters)
                                  to consider it significant when checking for
                                  numeric prefixes or suffixes. Prevents false
                                  positives for short lines. Default is 10.
                                  (Applies to: LineNumbersProcessor)
  --image_expansion_ratio FLOAT   The ratio to expand the image by when
                                  cropping. Default is 0.01. (Applies to:
                                  LLMComplexRegionProcessor,
                                  LLMEquationProcessor, LLMFormProcessor,
                                  LLMHandwritingProcessor,
                                  LLMImageDescriptionProcessor,
                                  LLMTableProcessor, LLMTableMergeProcessor,
                                  LLMTextProcessor)
  --use_llm                       Whether to use the LLM model. Default is
                                  False. (Applies to:
                                  LLMComplexRegionProcessor,
                                  LLMEquationProcessor, LLMFormProcessor,
                                  LLMHandwritingProcessor,
                                  LLMImageDescriptionProcessor,
                                  LLMTableProcessor, LLMTableMergeProcessor,
                                  LLMTextProcessor, PdfConverter,
                                  TableConverter)
  --min_equation_height FLOAT     The minimum ratio between equation height
                                  and page height to consider for processing.
                                  Default is 0.08. (Applies to:
                                  LLMEquationProcessor)
  --equation_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.05. (Applies to:
                                  LLMEquationProcessor)
  --equation_latex_prompt TEXT    The prompt to use for generating LaTeX from
                                  equations. Default is a string containing
                                  the Gemini prompt. (Applies to:
                                  LLMEquationProcessor)
  --handwriting_generation_prompt TEXT
                                  The prompt to use for OCRing handwriting.
                                  Default is a string containing the Gemini
                                  prompt. (Applies to:
                                  LLMHandwritingProcessor)
  --extract_images BOOLEAN        Extract images from the document. Default is
                                  True. (Applies to:
                                  LLMImageDescriptionProcessor, HTMLRenderer,
                                  JSONRenderer, MarkdownRenderer)
  --image_description_prompt TEXT
                                  The prompt to use for generating image
                                  descriptions. Default is a string containing
                                  the Gemini prompt. (Applies to:
                                  LLMImageDescriptionProcessor)
  --max_rows_per_batch INTEGER    If the table has more rows than this, chunk
                                  the table. (LLMs can be inaccurate with a
                                  lot of rows) Default is 60. (Applies to:
                                  LLMTableProcessor)
  --max_table_rows INTEGER        The maximum number of rows in a table to
                                  process with the LLM processor.  Beyond this
                                  will be skipped. Default is 175. (Applies
                                  to: LLMTableProcessor)
  --table_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0. (Applies to:
                                  LLMTableProcessor)
  --table_rewriting_prompt TEXT   The prompt to use for rewriting text.
                                  Default is a string containing the Gemini
                                  rewriting prompt. (Applies to:
                                  LLMTableProcessor)
  --table_height_threshold FLOAT  The minimum height ratio relative to the
                                  page for the first table in a pair to be
                                  considered for merging. Default is 0.6.
                                  (Applies to: LLMTableMergeProcessor)
  --table_start_threshold FLOAT   The maximum percentage down the page the
                                  second table can start to be considered for
                                  merging. Default is 0.2. (Applies to:
                                  LLMTableMergeProcessor)
  --vertical_table_height_threshold FLOAT
                                  The height tolerance for 2 adjacent tables
                                  to be merged into one. Default is 0.25.
                                  (Applies to: LLMTableMergeProcessor)
  --vertical_table_distance_threshold INTEGER
                                  The maximum distance between table edges for
                                  adjacency. Default is 20. (Applies to:
                                  LLMTableMergeProcessor)
  --horizontal_table_width_threshold FLOAT
                                  The width tolerance for 2 adjacent tables to
                                  be merged into one. Default is 0.25.
                                  (Applies to: LLMTableMergeProcessor)
  --horizontal_table_distance_threshold INTEGER
                                  The maximum distance between table edges for
                                  adjacency. Default is 20. (Applies to:
                                  LLMTableMergeProcessor)
  --column_gap_threshold INTEGER  The maximum gap between columns to merge
                                  tables Default is 50. (Applies to:
                                  LLMTableMergeProcessor)
  --table_merge_prompt TEXT       The prompt to use for rewriting text.
                                  Default is a string containing the Gemini
                                  rewriting prompt. (Applies to:
                                  LLMTableMergeProcessor)
  --level_count INTEGER           The number of levels to use for headings.
                                  Default is 4. (Applies to:
                                  SectionHeaderProcessor)
  --merge_threshold FLOAT         The minimum gap between headings to consider
                                  them part of the same group. Default is
                                  0.25. (Applies to: SectionHeaderProcessor)
  --default_level INTEGER         The default heading level to use if no
                                  heading level is detected. Default is 2.
                                  (Applies to: SectionHeaderProcessor)
  --height_tolerance FLOAT        The minimum height of a heading to consider
                                  it a heading. Default is 0.99. (Applies to:
                                  SectionHeaderProcessor)
  --detect_boxes                  Whether to detect boxes for the table
                                  recognition model. Default is False.
                                  (Applies to: TableProcessor)
  --detector_batch_size INTEGER   The batch size to use for the table
                                  detection model. Default is None, which will
                                  use the default batch size for the model.
                                  (Applies to: TableProcessor)
  --table_rec_batch_size INTEGER  The batch size to use for the table
                                  recognition model. Default is None, which
                                  will use the default batch size for the
                                  model. (Applies to: TableProcessor)
  --pdftext_workers INTEGER       The number of workers to use for pdftext.
                                  Default is 4. (Applies to: TableProcessor,
                                  PdfProvider)
  --row_split_threshold FLOAT     The percentage of rows that need to be split
                                  across the table before row splitting is
                                  active. Default is 0.5. (Applies to:
                                  TableProcessor)
  --column_gap_ratio FLOAT        The minimum ratio of the page width to the
                                  column gap to consider a column break.
                                  Default is 0.02. (Applies to: TextProcessor)
  --image_count INTEGER           Default is 1. (Applies to: ImageProvider)
  --flatten_pdf BOOLEAN           Whether to flatten the PDF structure.
                                  Default is True. (Applies to: PdfProvider)
  --force_ocr                     Whether to force OCR on the whole document.
                                  Default is False. (Applies to: PdfProvider)
  --ocr_space_threshold FLOAT     The minimum ratio of spaces to non-spaces to
                                  detect bad text. Default is 0.7. (Applies
                                  to: PdfProvider)
  --ocr_newline_threshold FLOAT   The minimum ratio of newlines to non-
                                  newlines to detect bad text. Default is 0.6.
                                  (Applies to: PdfProvider)
  --ocr_alphanum_threshold FLOAT  The minimum ratio of alphanumeric characters
                                  to non-alphanumeric characters to consider
                                  an alphanumeric character. Default is 0.3.
                                  (Applies to: PdfProvider)
  --image_threshold FLOAT         The minimum coverage ratio of the image to
                                  the page to consider skipping the page.
                                  Default is 0.65. (Applies to: PdfProvider)
  --strip_existing_ocr            Whether to strip existing OCR text from the
                                  PDF. Default is False. (Applies to:
                                  PdfProvider)
  --disable_links                 Whether to disable links. Default is False.
                                  (Applies to: PdfProvider)
  --paginate_output               Whether to paginate the output. Default is
                                  False. (Applies to: HTMLRenderer,
                                  MarkdownRenderer)
  --page_separator TEXT           The separator to use between pages. Default
                                  is '-' * 48. (Applies to: MarkdownRenderer)
  --DocumentBuilder_lowres_image_dpi INTEGER
                                  DPI setting for low-resolution page images
                                  used for Layout and Line Detection. Default
                                  is 96.
  --DocumentBuilder_highres_image_dpi INTEGER
                                  DPI setting for high-resolution page images
                                  used for OCR. Default is 192.
  --DocumentBuilder_disable_ocr   Disable OCR processing. Default is False.
  --LayoutBuilder_batch_size OPTIONAL
                                  The batch size to use for the layout model.
                                  Default is None, which will use the default
                                  batch size for the model.
  --LayoutBuilder_layout_coverage_min_lines INTEGER
                                  The minimum number of PdfProvider lines that
                                  must be covered by the layout model to
                                  consider the lines from the PdfProvider
                                  valid. Default is 1.
  --LayoutBuilder_layout_coverage_threshold FLOAT
                                  The minimum coverage ratio required for the
                                  layout model to consider the lines from the
                                  PdfProvider valid. Default is 0.1.
  --LayoutBuilder_document_ocr_threshold FLOAT
                                  The minimum ratio of pages that must pass
                                  the layout coverage check to avoid OCR.
                                  Default is 0.8.
  --LayoutBuilder_force_layout_block TEXT
                                  Skip layout and force every page to be
                                  treated as a specific block type. Default is
                                  None.
  --OcrBuilder_recognition_batch_size OPTIONAL
                                  The batch size to use for the recognition
                                  model. Default is None, which will use the
                                  default batch size for the model.
  --OcrBuilder_detection_batch_size OPTIONAL
                                  The batch size to use for the detection
                                  model. Default is None, which will use the
                                  default batch size for the model.
  --OcrBuilder_enable_table_ocr   Whether to skip OCR on tables.  The
                                  TableProcessor will re-OCR them.  Only
                                  enable if the TableProcessor is not running.
                                  Default is False.
  --LLMLayoutBuilder_batch_size OPTIONAL
                                  The batch size to use for the layout model.
                                  Default is None, which will use the default
                                  batch size for the model.
  --LLMLayoutBuilder_layout_coverage_min_lines INTEGER
                                  The minimum number of PdfProvider lines that
                                  must be covered by the layout model to
                                  consider the lines from the PdfProvider
                                  valid. Default is 1.
  --LLMLayoutBuilder_layout_coverage_threshold FLOAT
                                  The minimum coverage ratio required for the
                                  layout model to consider the lines from the
                                  PdfProvider valid. Default is 0.1.
  --LLMLayoutBuilder_document_ocr_threshold FLOAT
                                  The minimum ratio of pages that must pass
                                  the layout coverage check to avoid OCR.
                                  Default is 0.8.
  --LLMLayoutBuilder_force_layout_block TEXT
                                  Skip layout and force every page to be
                                  treated as a specific block type. Default is
                                  None.
  --LLMLayoutBuilder_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMLayoutBuilder_confidence_threshold FLOAT
                                  The confidence threshold to use for
                                  relabeling (anything below is relabeled).
                                  Default is 0.7.
  --LLMLayoutBuilder_picture_height_threshold FLOAT
                                  The height threshold for pictures that may
                                  actually be complex regions. (anything above
                                  this ratio against the page is relabeled)
                                  Default is 0.8.
  --LLMLayoutBuilder_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMLayoutBuilder_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMLayoutBuilder_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMLayoutBuilder_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMLayoutBuilder_topk_relabelling_prompt TEXT
                                  The prompt to use for relabelling blocks.
                                  Default is a string containing the Gemini
                                  relabelling prompt.
  --LLMLayoutBuilder_complex_relabeling_prompt TEXT
                                  The prompt to use for complex relabelling
                                  blocks. Default is a string containing the
                                  complex relabelling prompt.
  --StructureBuilder_gap_threshold FLOAT
                                  The minimum gap between blocks to consider
                                  them part of the same group. Default is
                                  0.05.
  --StructureBuilder_list_gap_threshold FLOAT
                                  The minimum gap between list items to
                                  consider them part of the same group.
                                  Default is 0.1.
  --BlockquoteProcessor_min_x_indent FLOAT
                                  The minimum horizontal indentation required
                                  to consider a block as part of a blockquote.
                                  Expressed as a percentage of the block
                                  width. Default is 0.05.
  --BlockquoteProcessor_x_start_tolerance FLOAT
                                  The maximum allowable difference between the
                                  starting x-coordinates of consecutive blocks
                                  to consider them aligned. Expressed as a
                                  percentage of the block width. Default is
                                  0.01.
  --BlockquoteProcessor_x_end_tolerance FLOAT
                                  The maximum allowable difference between the
                                  ending x-coordinates of consecutive blocks
                                  to consider them aligned. Expressed as a
                                  percentage of the block width. Default is
                                  0.01.
  --DebugProcessor_debug_data_folder TEXT
                                  The folder to dump debug data to. Default is
                                  debug_data.
  --DebugProcessor_debug_layout_images
                                  Whether to dump layout debug images. Default
                                  is False.
  --DebugProcessor_debug_pdf_images
                                  Whether to dump PDF debug images. Default is
                                  False.
  --DebugProcessor_debug_json     Whether to dump block debug data. Default is
                                  False.
  --DebugProcessor_render_font TEXT
                                  The path to the font to use for rendering
                                  debug images. Default is D:\Workspaces\pytho
                                  n_OCR\marker\static\fonts\GoNotoCurrent-
                                  Regular.ttf.
  --DebugProcessor_font_dl_path TEXT
                                  The path to download the font from. Default
                                  is https://github.com/satbyy/go-noto-
                                  universal/releases/download/v7.0.
  --EquationProcessor_model_max_length INTEGER
                                  The maximum number of tokens to allow for
                                  the Texify model. Default is 768.
  --EquationProcessor_texify_batch_size OPTIONAL
                                  The batch size to use for the Texify model.
                                  Default is None, which will use the default
                                  batch size for the model.
  --EquationProcessor_token_buffer INTEGER
                                  The number of tokens to buffer above max for
                                  the Texify model. Default is 256.
  --IgnoreTextProcessor_common_element_threshold FLOAT
                                  The minimum ratio of pages a text block must
                                  appear on to be considered a common element.
                                  Blocks that meet or exceed this threshold
                                  are marked as common elements. Default is
                                  0.2.
  --IgnoreTextProcessor_common_element_min_blocks INTEGER
                                  The minimum number of occurrences of a text
                                  block within a document to consider it a
                                  common element. This ensures that rare
                                  blocks are not mistakenly flagged. Default
                                  is 3.
  --IgnoreTextProcessor_max_streak INTEGER
                                  The maximum number of consecutive
                                  occurrences of a text block allowed before
                                  it is classified as a common element. Helps
                                  to identify patterns like repeated headers
                                  or footers. Default is 3.
  --IgnoreTextProcessor_text_match_threshold INTEGER
                                  The minimum fuzzy match score (0-100)
                                  required to classify a text block as similar
                                  to a common element. Higher values enforce
                                  stricter matching. Default is 90.
  --LineNumbersProcessor_strip_numbers_threshold FLOAT
                                  The fraction of lines or tokens in a block
                                  that must be numeric to consider them as
                                  line numbers. Default is 0.6.
  --LineNumbersProcessor_min_lines_in_block INTEGER
                                  The minimum number of lines required in a
                                  block for it to be considered during
                                  processing. Ensures that small blocks are
                                  ignored as they are unlikely to contain
                                  meaningful line numbers. Default is 4.
  --LineNumbersProcessor_min_line_length INTEGER
                                  The minimum length of a line (in characters)
                                  to consider it significant when checking for
                                  numeric prefixes or suffixes. Prevents false
                                  positives for short lines. Default is 10.
  --ListProcessor_min_x_indent FLOAT
                                  The minimum horizontal indentation required
                                  to consider a block as a nested list item.
                                  This is expressed as a percentage of the
                                  page width and is used to determine
                                  hierarchical relationships within a list.
                                  Default is 0.01.
  --LLMComplexRegionProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMComplexRegionProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMComplexRegionProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMComplexRegionProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMComplexRegionProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMComplexRegionProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMComplexRegionProcessor_use_llm
                                  Whether to use the LLM model. Default is
                                  False.
  --LLMEquationProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMEquationProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMEquationProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMEquationProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMEquationProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMEquationProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMEquationProcessor_use_llm  Whether to use the LLM model. Default is
                                  False.
  --LLMEquationProcessor_min_equation_height FLOAT
                                  The minimum ratio between equation height
                                  and page height to consider for processing.
                                  Default is 0.08.
  --LLMEquationProcessor_equation_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.05.
  --LLMEquationProcessor_equation_latex_prompt TEXT
                                  The prompt to use for generating LaTeX from
                                  equations. Default is a string containing
                                  the Gemini prompt.
  --LLMFormProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMFormProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMFormProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMFormProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMFormProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMFormProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMFormProcessor_use_llm      Whether to use the LLM model. Default is
                                  False.
  --LLMHandwritingProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMHandwritingProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMHandwritingProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMHandwritingProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMHandwritingProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMHandwritingProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMHandwritingProcessor_use_llm
                                  Whether to use the LLM model. Default is
                                  False.
  --LLMHandwritingProcessor_handwriting_generation_prompt TEXT
                                  The prompt to use for OCRing handwriting.
                                  Default is a string containing the Gemini
                                  prompt.
  --LLMImageDescriptionProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMImageDescriptionProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMImageDescriptionProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMImageDescriptionProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMImageDescriptionProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMImageDescriptionProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMImageDescriptionProcessor_use_llm
                                  Whether to use the LLM model. Default is
                                  False.
  --LLMImageDescriptionProcessor_extract_images BOOLEAN
                                  Extract images from the document. Default is
                                  True.
  --LLMImageDescriptionProcessor_image_description_prompt TEXT
                                  The prompt to use for generating image
                                  descriptions. Default is a string containing
                                  the Gemini prompt.
  --LLMTableProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMTableProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMTableProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMTableProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMTableProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMTableProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMTableProcessor_use_llm     Whether to use the LLM model. Default is
                                  False.
  --LLMTableProcessor_max_rows_per_batch INTEGER
                                  If the table has more rows than this, chunk
                                  the table. (LLMs can be inaccurate with a
                                  lot of rows) Default is 60.
  --LLMTableProcessor_max_table_rows INTEGER
                                  The maximum number of rows in a table to
                                  process with the LLM processor.  Beyond this
                                  will be skipped. Default is 175.
  --LLMTableProcessor_table_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.
  --LLMTableProcessor_table_rewriting_prompt TEXT
                                  The prompt to use for rewriting text.
                                  Default is a string containing the Gemini
                                  rewriting prompt.
  --LLMTableMergeProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMTableMergeProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMTableMergeProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMTableMergeProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMTableMergeProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMTableMergeProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMTableMergeProcessor_use_llm
                                  Whether to use the LLM model. Default is
                                  False.
  --LLMTableMergeProcessor_table_height_threshold FLOAT
                                  The minimum height ratio relative to the
                                  page for the first table in a pair to be
                                  considered for merging. Default is 0.6.
  --LLMTableMergeProcessor_table_start_threshold FLOAT
                                  The maximum percentage down the page the
                                  second table can start to be considered for
                                  merging. Default is 0.2.
  --LLMTableMergeProcessor_vertical_table_height_threshold FLOAT
                                  The height tolerance for 2 adjacent tables
                                  to be merged into one. Default is 0.25.
  --LLMTableMergeProcessor_vertical_table_distance_threshold INTEGER
                                  The maximum distance between table edges for
                                  adjacency. Default is 20.
  --LLMTableMergeProcessor_horizontal_table_width_threshold FLOAT
                                  The width tolerance for 2 adjacent tables to
                                  be merged into one. Default is 0.25.
  --LLMTableMergeProcessor_horizontal_table_distance_threshold INTEGER
                                  The maximum distance between table edges for
                                  adjacency. Default is 20.
  --LLMTableMergeProcessor_column_gap_threshold INTEGER
                                  The maximum gap between columns to merge
                                  tables Default is 50.
  --LLMTableMergeProcessor_table_merge_prompt TEXT
                                  The prompt to use for rewriting text.
                                  Default is a string containing the Gemini
                                  rewriting prompt.
  --LLMTextProcessor_google_api_key TEXT
                                  The Google API key to use for the Gemini
                                  model. Default is .
  --LLMTextProcessor_model_name TEXT
                                  The name of the Gemini model to use. Default
                                  is gemini-1.5-flash.
  --LLMTextProcessor_max_retries INTEGER
                                  The maximum number of retries to use for the
                                  Gemini model. Default is 3.
  --LLMTextProcessor_max_concurrency INTEGER
                                  The maximum number of concurrent requests to
                                  make to the Gemini model. Default is 3.
  --LLMTextProcessor_timeout INTEGER
                                  The timeout for requests to the Gemini
                                  model. Default is 60.
  --LLMTextProcessor_image_expansion_ratio FLOAT
                                  The ratio to expand the image by when
                                  cropping. Default is 0.01.
  --LLMTextProcessor_use_llm      Whether to use the LLM model. Default is
                                  False.
  --SectionHeaderProcessor_level_count INTEGER
                                  The number of levels to use for headings.
                                  Default is 4.
  --SectionHeaderProcessor_merge_threshold FLOAT
                                  The minimum gap between headings to consider
                                  them part of the same group. Default is
                                  0.25.
  --SectionHeaderProcessor_default_level INTEGER
                                  The default heading level to use if no
                                  heading level is detected. Default is 2.
  --SectionHeaderProcessor_height_tolerance FLOAT
                                  The minimum height of a heading to consider
                                  it a heading. Default is 0.99.
  --TableProcessor_detect_boxes   Whether to detect boxes for the table
                                  recognition model. Default is False.
  --TableProcessor_detector_batch_size INTEGER
                                  The batch size to use for the table
                                  detection model. Default is None, which will
                                  use the default batch size for the model.
  --TableProcessor_table_rec_batch_size INTEGER
                                  The batch size to use for the table
                                  recognition model. Default is None, which
                                  will use the default batch size for the
                                  model.
  --TableProcessor_recognition_batch_size INTEGER
                                  The batch size to use for the table
                                  recognition model. Default is None, which
                                  will use the default batch size for the
                                  model.
  --TableProcessor_pdftext_workers INTEGER
                                  The number of workers to use for pdftext.
                                  Default is 4.
  --TableProcessor_row_split_threshold FLOAT
                                  The percentage of rows that need to be split
                                  across the table before row splitting is
                                  active. Default is 0.5.
  --TextProcessor_column_gap_ratio FLOAT
                                  The minimum ratio of the page width to the
                                  column gap to consider a column break.
                                  Default is 0.02.
  --PdfConverter_use_llm          Enable higher quality processing with LLMs.
                                  Default is False.
  --TableConverter_use_llm        Enable higher quality processing with LLMs.
                                  Default is False.
  --ImageProvider_image_count INTEGER
                                  Default is 1.
  --PdfProvider_pdftext_workers INTEGER
                                  The number of workers to use for pdftext.
                                  Default is 4.
  --PdfProvider_flatten_pdf BOOLEAN
                                  Whether to flatten the PDF structure.
                                  Default is True.
  --PdfProvider_force_ocr         Whether to force OCR on the whole document.
                                  Default is False.
  --PdfProvider_ocr_space_threshold FLOAT
                                  The minimum ratio of spaces to non-spaces to
                                  detect bad text. Default is 0.7.
  --PdfProvider_ocr_newline_threshold FLOAT
                                  The minimum ratio of newlines to non-
                                  newlines to detect bad text. Default is 0.6.
  --PdfProvider_ocr_alphanum_threshold FLOAT
                                  The minimum ratio of alphanumeric characters
                                  to non-alphanumeric characters to consider
                                  an alphanumeric character. Default is 0.3.
  --PdfProvider_image_threshold FLOAT
                                  The minimum coverage ratio of the image to
                                  the page to consider skipping the page.
                                  Default is 0.65.
  --PdfProvider_strip_existing_ocr
                                  Whether to strip existing OCR text from the
                                  PDF. Default is False.
  --PdfProvider_disable_links     Whether to disable links. Default is False.
  --HTMLRenderer_extract_images BOOLEAN
                                  Extract images from the document. Default is
                                  True.
  --HTMLRenderer_paginate_output  Whether to paginate the output. Default is
                                  False.
  --JSONRenderer_extract_images BOOLEAN
                                  Extract images from the document. Default is
                                  True.
  --MarkdownRenderer_extract_images BOOLEAN
                                  Extract images from the document. Default is
                                  True.
  --MarkdownRenderer_paginate_output
                                  Whether to paginate the output. Default is
                                  False.
  --MarkdownRenderer_page_separator TEXT
                                  The separator to use between pages. Default
                                  is '-' * 48.
  --help                          Show this message and exit.
```



```shell
marker_single pdf/腾讯公益慈善基金会2019年度审计报告.pdf --output_dir ./output --output_format markdown
```







```shell
marker_single assets/examples/600017_20061016_2.pdf output --batch_multiplier 2 --max_pages 10 


python pdf_extract.py --pdf assets/examples/600017_20061016_2.pdf

marker_single C:/Workspaces/app-data/gov-data/data/600017_20061016_2.pdf output --batch_multiplier 2 --max_pages 10 
```





```shell
marker_single data/600031_20240830_SZUX.pdf output --batch_multiplier 2 --max_pages 10 
```





- Skip

  ```shell
  marker_single data/600031_20240830_SZUX.pdf 600031_20240830_SZUX --batch_multiplier 2 --max_pages 10
  
  marker_single data/600031_20240830_SZUX.pdf ./600031_20240830_SZUX_S2 --batch_multiplier 2 --start_page 11 --max_pages 10 
  ```


​	

```shell
marker_single data/688695_20240308_SKFK.pdf test-01 --batch_multiplier 2 --start_page 0 --max_pages 5
```





- 
