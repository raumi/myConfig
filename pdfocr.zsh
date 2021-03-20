#!/bin/zsh
# Converts an input PDF to an output PDF using Tesseract OCR.
# Dependencies:
#  - pdfseparate
#  - pdfunite
#  - tesseract (see https://tesseract-ocr.github.io/tessdoc/Home.html)
# N.B. last tested with Tesseract Open Source OCR Engine v4.1.1 with Leptonica

# if you need to use bash...
#emulate -LR bash

# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# the temp directory used, within $DIR
WORK_DIR=`mktemp -d "$DIR-temp"`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# copy input to working directory
cp $1 $WORK_DIR

cd $WORK_DIR
OUTPUT=$1-ocr-output.pdf

# separate input PDF into one PDF per page
pdfseparate $1 %dpage.$1

# report to user what's coming next
NUM_FILES_TO_PROCESS=`ls *page* |wc -l`
echo "Separated input into $NUM_FILES_TO_PROCESS PDF files, now processing with sips and tesseract..."

# convert individual PDFs to PNGs
for file in `ls *page*`; do echo "Processing $file" && sips -s format png $file --out $file.png; done

# convert PNGs with OCR back to PDFs
for file in `ls *png`; do echo "Processing $file" && /usr/local/Cellar/tesseract/4.1.1/bin/tesseract $file $file-ocrbaby PDF; done

# report to user what's coming next
SORTED=`ls -tr [0-9]*-ocrbaby* | sort -t. -k1,1n -s`
echo "Now uniting OCR completed PDF files $SORTED"

# unite OCR converted PDF files in original page order
pdfunite $(ls -tr [0-9]*-ocrbaby* | sort -t. -k1,1n -s ) $OUTPUT

# move output to caller's directory
mv $OUTPUT $DIR
