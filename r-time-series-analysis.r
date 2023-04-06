{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "27c4bf33",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:37.490403Z",
     "iopub.status.busy": "2023-04-06T12:12:37.487967Z",
     "iopub.status.idle": "2023-04-06T12:12:39.034328Z",
     "shell.execute_reply": "2023-04-06T12:12:39.031627Z"
    },
    "papermill": {
     "duration": 1.556136,
     "end_time": "2023-04-06T12:12:39.037372",
     "exception": false,
     "start_time": "2023-04-06T12:12:37.481236",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n",
      "\n",
      "Attaching package: ‘mice’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    cbind, rbind\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(mice)\n",
    "library(RColorBrewer)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "dde8c46d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.085489Z",
     "iopub.status.busy": "2023-04-06T12:12:39.047271Z",
     "iopub.status.idle": "2023-04-06T12:12:39.114373Z",
     "shell.execute_reply": "2023-04-06T12:12:39.112338Z"
    },
    "papermill": {
     "duration": 0.075868,
     "end_time": "2023-04-06T12:12:39.117223",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.041355",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "income_data <- read.table(file='/kaggle/input/case-ih-time-series-data/data.csv', header=TRUE, sep=',')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "a8df8a89",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.128178Z",
     "iopub.status.busy": "2023-04-06T12:12:39.126546Z",
     "iopub.status.idle": "2023-04-06T12:12:39.159051Z",
     "shell.execute_reply": "2023-04-06T12:12:39.157282Z"
    },
    "papermill": {
     "duration": 0.040983,
     "end_time": "2023-04-06T12:12:39.161468",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.120485",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>date</th><th scope=col>work</th><th scope=col>income</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Thursday, September 30, 2021</td><td>2</td><td> 2100</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>Sunday, October 03, 2021    </td><td>1</td><td> 3600</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>Monday, October 04, 2021    </td><td>1</td><td> 4000</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>Tuesday, October 05, 2021   </td><td>1</td><td> 7900</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>Wednesday, October 06, 2021 </td><td>1</td><td> 7500</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>Thursday, October 07, 2021  </td><td>1</td><td>10600</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & date & work & income\\\\\n",
       "  & <chr> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & Thursday, September 30, 2021 & 2 &  2100\\\\\n",
       "\t2 & Sunday, October 03, 2021     & 1 &  3600\\\\\n",
       "\t3 & Monday, October 04, 2021     & 1 &  4000\\\\\n",
       "\t4 & Tuesday, October 05, 2021    & 1 &  7900\\\\\n",
       "\t5 & Wednesday, October 06, 2021  & 1 &  7500\\\\\n",
       "\t6 & Thursday, October 07, 2021   & 1 & 10600\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | date &lt;chr&gt; | work &lt;int&gt; | income &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | Thursday, September 30, 2021 | 2 |  2100 |\n",
       "| 2 | Sunday, October 03, 2021     | 1 |  3600 |\n",
       "| 3 | Monday, October 04, 2021     | 1 |  4000 |\n",
       "| 4 | Tuesday, October 05, 2021    | 1 |  7900 |\n",
       "| 5 | Wednesday, October 06, 2021  | 1 |  7500 |\n",
       "| 6 | Thursday, October 07, 2021   | 1 | 10600 |\n",
       "\n"
      ],
      "text/plain": [
       "  date                         work income\n",
       "1 Thursday, September 30, 2021 2     2100 \n",
       "2 Sunday, October 03, 2021     1     3600 \n",
       "3 Monday, October 04, 2021     1     4000 \n",
       "4 Tuesday, October 05, 2021    1     7900 \n",
       "5 Wednesday, October 06, 2021  1     7500 \n",
       "6 Thursday, October 07, 2021   1    10600 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(income_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "74b7591d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.172231Z",
     "iopub.status.busy": "2023-04-06T12:12:39.170662Z",
     "iopub.status.idle": "2023-04-06T12:12:39.194311Z",
     "shell.execute_reply": "2023-04-06T12:12:39.192100Z"
    },
    "papermill": {
     "duration": 0.032102,
     "end_time": "2023-04-06T12:12:39.196978",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.164876",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t192 obs. of  3 variables:\n",
      " $ date  : chr  \"Thursday, September 30, 2021\" \"Sunday, October 03, 2021\" \"Monday, October 04, 2021\" \"Tuesday, October 05, 2021\" ...\n",
      " $ work  : int  2 1 1 1 1 1 1 3 1 3 ...\n",
      " $ income: int  2100 3600 4000 7900 7500 10600 6700 5800 6800 8000 ...\n"
     ]
    }
   ],
   "source": [
    "str(income_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "88ffdece",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.207763Z",
     "iopub.status.busy": "2023-04-06T12:12:39.206213Z",
     "iopub.status.idle": "2023-04-06T12:12:39.226744Z",
     "shell.execute_reply": "2023-04-06T12:12:39.224345Z"
    },
    "papermill": {
     "duration": 0.029431,
     "end_time": "2023-04-06T12:12:39.230004",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.200573",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>192</li><li>3</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 192\n",
       "\\item 3\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 192\n",
       "2. 3\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 192   3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(income_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "900f31df",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.242346Z",
     "iopub.status.busy": "2023-04-06T12:12:39.240586Z",
     "iopub.status.idle": "2023-04-06T12:12:39.261139Z",
     "shell.execute_reply": "2023-04-06T12:12:39.258808Z"
    },
    "papermill": {
     "duration": 0.030333,
     "end_time": "2023-04-06T12:12:39.264381",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.234048",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'date'</li><li>'work'</li><li>'income'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'date'\n",
       "\\item 'work'\n",
       "\\item 'income'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'date'\n",
       "2. 'work'\n",
       "3. 'income'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"date\"   \"work\"   \"income\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(income_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "36b00897",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.275917Z",
     "iopub.status.busy": "2023-04-06T12:12:39.274367Z",
     "iopub.status.idle": "2023-04-06T12:12:39.619481Z",
     "shell.execute_reply": "2023-04-06T12:12:39.616409Z"
    },
    "papermill": {
     "duration": 0.354409,
     "end_time": "2023-04-06T12:12:39.622601",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.268192",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      " /\\     /\\\n",
      "{  `---'  }\n",
      "{  O   O  }\n",
      "==>  V <==  No need for mice. This data set is completely observed.\n",
      " \\  \\|/  /\n",
      "  `-----'\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>date</th><th scope=col>work</th><th scope=col>income</th><th scope=col></th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>192</th><td>1</td><td>1</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row></th><td>0</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & date & work & income & \\\\\n",
       "\\hline\n",
       "\t192 & 1 & 1 & 1 & 0\\\\\n",
       "\t & 0 & 0 & 0 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | date | work | income | <!----> |\n",
       "|---|---|---|---|---|\n",
       "| 192 | 1 | 1 | 1 | 0 |\n",
       "| <!----> | 0 | 0 | 0 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "    date work income  \n",
       "192 1    1    1      0\n",
       "    0    0    0      0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nVAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsA\ngCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcA\nEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAA\nghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBA\nEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAI\nQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAI\nYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh\n7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCE\nHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISw\nAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2\nAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIO\nACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgB\nAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsA\ngCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcA\nEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAA\nghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBA\nEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAI\nQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAI\nYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh\n7AAAgvj/F7ECPw2aI3cAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "md.pattern(income_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "752526b9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.635017Z",
     "iopub.status.busy": "2023-04-06T12:12:39.633424Z",
     "iopub.status.idle": "2023-04-06T12:12:39.746887Z",
     "shell.execute_reply": "2023-04-06T12:12:39.743905Z"
    },
    "papermill": {
     "duration": 0.123032,
     "end_time": "2023-04-06T12:12:39.750036",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.627004",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3xV9d3A8V92wgxDZYkDUZHhLrjFiRRxUuugaqWPPu7VahFn66wat0/digWr\nVasotlbFihr3QEEQBzhB9ggJIcl9/gjGCAEuI7m5P97vP/q6nHty+Sa/XPn03HvOzUgkEgEA\ngPSXmeoBAABYN4QdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHZCsRdPvzUjCgDenp3rS\nmJXNGV3njz0zM7NZyzZb7dT39CvumlpWWbP/9DcH1OwzZXHlSh4ZiICwA4hBIpEomT/703df\nvv3Sk7tv3veV2YvX4YPvtv22PXv27Nmz5+DHvlyHDwusc9mpHgCAdazk+7GH73X5zI+uWlcP\n+MnHH8+pqAohtFinvQisc47YAWtiu0tembkCI3faMNXTrS+6nfx8zY/9u6mfjrr38g55WdV3\nzfr46hEzSlM7HtDwHLED1kR2k5Zt2rRJ9RTru6yCWqvQps2A317yQvl/tvnfV6s3PPDOjGMO\n6ryWf8WMN8aOKylfklj6x3kTi1988ds2O+6xXWHuWj4yUB8csQPqxfib+1S/YT8rp3UIYfrr\nI47cvVfrgtypP75/f8aHz559wqFbbdK+aV5+u0222rPfMXePervO9/bPm/ivM44+oPNGrXKb\nttpqp35X/+3t8gXFNScEHPHJrOrdxhy2efWWphsMqv3ltc/5GDZ1fu27VjnDMt/FG8Ov7Lfz\nVq2b5xc0b9Vzt4P+MvKt5actnzup6MJT9th2izYtmuQ2abHx1jsdd9ZV70z76eDZc0d2qZnn\nX3N+9srm+5ftUL09O6/9D0uqkv1Z17LxwUf89HObMH8le4YQEhWzH7v54kP23qHDBoW5uQUb\ndOi818HHFf19bEXip31eO+nw/fbbb2Hl0mHG3/Tb/fbb748fzlyD2YCGkABITsm0e2r+07HT\nNR+ufOePb+pdvWdmdquZ793SKnvp/438sqwikUi8dOPxORkZy/8XqfM+p369uKL240x+Yljz\nrGX/L+je5/+55vbhE2ZW7/nSoZtVb2nS9sgVjX3RlHk125OZofZ38cIl+y6/88Dr3679d01/\n/a9dm+Qsv1t2/sY3vjKtep+5n11Rs32PeyfV/vJzOjWv3t6x7yMr+sGWzn625st7nP3mMvcu\n+Pammnt3u2tiIpGY9sYva7ZU//CX7jn1X/tu3Gz5UUMIHfc85dNFS6p3e3Kbtsvv0O/lb1c0\nHpBawg5IVu1CWpHffjq7eudaSdTiV+2b1m6Lb56/IOPHomq1dZ8jjv71frt2q9mhw15X1PyN\nC799vDD7p6rLyi1s9eN7yGqsWdglOUPNd5GRkZmVkRFCyG7SPKtWDmblbjT1x1paPO+1rgU5\nP+6f0bnbtttuvXn2jztnF2z+4cLyRCKRSFTuXZhfvbFwiz/XzLmkZHxNaJ72/owVrcLKw27i\nXXvW3Hvcez8kVhB2FaWf921bULM9u6BNj15dm9QK6I12/WNlrYet6fJd/++TVf+iAKnjpVig\nflVVzH9sWumuh5105V+Kiq6/ujArcfoxtyYSiRBCl1//dfqE4n+MGPmf1yaM+/v/Vu//3X8v\nufCjpa+uPvyr0+dWVIUQMrIKzrjzpXmLZs9aNP+/d5/TbLljeKupMvkZqiUSVa13PP4/479b\nXDK/dN6UKwYufe9aZfn0v3yzoPr2f886cXLpkhBCZk7re1//duqEDz745POv37y7ZXZmCKGi\n9Ivf3TExhBBC5nUnda3+knlfXvn5j9ec++GtS5ckEiGEnIItr+2V1PsXKxcvnPejmd9Pff7h\nq/c74/XquzKzml24VasVfeE7VxwxZubSV4cPvvDB+QtnfvThp/MXfHXVr7as3jj99avPecP1\nCCENpbosgbSxZkfsQgj9bn2n5kEWfv9/NdufnFla+/EPabP0GNJmhz2fSCQqFn9TkLn0CNY2\np71Ye88xZ3aveZA1OGKX/Ay1v4uX5y7+6TF/+FvN9oNe+656407Nl55P0Pmgf9R+zCcP27FT\np06dOnXqsdeI6i2LfhhZ8+WDfnxZ8/G+HZf+1YePXskq1D5itxJbHL10hjqP2O3Xaukhw7bb\nXVX7wSuXzNzxx++iwx4/fReO2EG6cMQOWBMrutzJLV0Kl9kzIyPzwZO3r/njnI+eqLl9WNuC\n2p+d8NSspceQZr33agihZNo9pVVL38Z/woU7137MHX//m7UZPvkZamRmF+7V8qfzQPOa96m5\nnViSCCEsKfnwnQXlS8e7bPfaX3voE+98/fXXX3/99UcvH129pWCDX/+u/dL3t7067L8hhJCo\nuOStH6q3HHftLmvz3YUQWvc65sX7D13RvRWln74wp6z69vZXHVv7rszsNlft1q769pxP/rbs\nVwKNnrAD1kT15U6W1zRz2dMRMrJabJjz039qFk5ZuMoHr1g0KYRQUfpZzZYdmv3s4hq5zXZc\nm+GTn6GWn39fGcv+x7Oy7Iua2102yF/l45976XbVN2a8M7SkKrHwu9vGlywJIeS16H3JcnGc\npOyC5pv23P2MKx+c9O7wzsu9GbHOUTt1ab7Mva17Lf3ba//8gXThOnZAfftZEjXp2GTp1oys\np0c/m1PHaakhK7d9CCE7v0vNlnElS/YtzKv545JFH6/0b0ys9N7VmCF5mbkda25/M798lft3\nOeaG3FP7lFclKsqmXPHZ3KMfGV69fbOjrs+ua5469Tj7zY+KfrFac4YQsvI3q7n97ZcLw5Y/\neyvenAnzqm9k563tNfCAhifsgAbVqtcBIbwQQkgkKvP67L1/rVwrmzVjXkVVCCEzuzCE0LTd\nSXmZVyyuSoQQ7i96/5zr96jZ88Ob71v+kTN+DKIlJeMStXJy8Zxljr2txgzJy222Q9eCnOqT\nJ9694f3w0AE1dz111K7nvzcjhNCq6zVvjV56nbmc5r+4YqtWF34yO4Tw5J/HVY6ZXL39tB+P\n5NWf7IKt9irM++/cxSGED4Y9Gg48r+auqorZF/33++rbLbb4dX1PAqxzXooFGlTzDmfs3nJp\nSJ1x3sO1PtLgqS07dmjXrl27du2OGPF5CCErb+Prd9yg+t7xN/X//f2vlydCSJS//sAFB91Q\nxxG7Ft1aVN9YUjr5V7f+e0kihFD1ZfHjgw/8v2X2TH6G1ZCRfc0BSw/afT5y0DVPf1p9e9rb\nd//miTc/++yzzz77rMlhPWp/xTE37FV9Y+qT597y3cIQQkGbAad3rPvacuvWVSdtVX3jh3fO\nP+LSR6p/ApVlXw878hdv//hOwcOvr+O6faXf+5gyaNxSffYGkDbW+ALFy9z12d+Or3mc1lvt\neszxJxzef7eaK5g073zorCVV1XvOn/JQQa037WU32WCDJtkhhIyMny4CXHNW7NzPLqv9H7es\n3OYtC6p3/undZjXXsUtyhhV9FxVlX9Z8ec3VektnPts+96e/a4NNe+zYc8ua69jltej9VdnP\nrr1csfibtjk/eyfcdhe9u8pVWPl17JZX51mxSxZN2r3VT28EzG3RfvsdtmlR662QG+3yh9rX\nsevZdOkPPKfpNicM+Z/rP5mzyr8XSAlH7ICG1uWYB/7+x6W1MXvS6yMefOCJ0a9Vf2hVm55H\nPv/BI61/fFG1+SaD33nwtIKspX+sWDRjxqKKEMLh19+x/MO27HLp1f02qfljZfmCeaUVGZl5\np987bG1mSF5+m/5vj7q2449nLcyY8vG7H31akUiEEPIKe97/5r82/vkJDVm5HW/etV3tLUPP\n7hYaRHbBlqPf/cdeHZdeOLp8/vfvvzdh/o8fYtZp7/999aUra//zMLRvh+obS0omPHDPXS9M\nX9QwcwKrS9gBKfCrq5754pURvxt0wKbt2ubl5HfYrNteBx5xzT3PfvPBY31a5dXec5vjbv36\nvSdPO2q/Thu2zCloscUO+18z8v0Rv+te58Ne8Oz4+/982s7dOjXJy2pauMEO+//63pc/v6b/\nxms5Q/I6HnDe5KnvXH3Oib/YepOWTXJzCpp37t77pD/e9OFX7x69dR1v2jvgpsNqbjdtd9Kg\nWp8GUd+ab/bLl76c8siNQ3+5R68NW7fIzs5rvVGnPQccW/T3sV++dMcW+T97B/agx8YMHXxg\np9bNMjOzW7TtvHXL3BU9LJBaGYnEKk4fA2hsyhcU57XYtfr24RNmPt4tqc9paIQSVaWbN20x\npawihLDLzeNfP3ObVE8EpDdH7ABSJlG5YHb1Z6ZlZF19fJdV7g+wci53ApACsxeU55R+c+cf\nBsyvqAohtNz8gr1aruHrvwA1hB1ACuzfofl7C3+6jvGA205J4TBANIQdkH4ys5rvvvvSz2Pt\nVpCz8p0bv56H/+mBfnWf4QGwWpw8AZACD/7lz5PnV7XZqEOvPvvuu9Nmq/4CgCQIOwCASDgr\nFgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEtmpHgBYDZWVlaNHjy4rK0v1IGsoPz+/f//+WVlZqR4EIE7CDtLJc889N3DgwFRPsVZG\njRo1YMCAVE8BECdhB+mktLQ0hHBuCH1SPckaeCOEG3/8FgCoD8IO0k+fEAalegYAGiEnTwAA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEIjvVA6yhOd9/OWnS5Omz55csKsvOb9qyTbuuW3fbvH1hqucC\nAEiZNAu7ROW8R4suv+XeEa9PnL78ve227nPMkLMuPuuowuyMhp8NACC10insKsu/PXHnbYeP\nm5WV07r3PgN7devSvm1hXl52xeLFc2dOmzp5/Otj37zx/KMfGvHMh8UPdcj1KjMAsH5Jp7Ar\nPq/f8HGzdj/95pHXnNqpaR2TV5XPGnntaYMvHbH/GUPG/3XvBh8QACCV0umw1tDhk5u1P2Xs\nrWfWWXUhhMzcNsde/MidvTf6/JFhDTwbAEDKpVPYfVSypFnng1e52457brhk0fgGmAcAoFFJ\np7A7pE3BnInXTCuvWtlOVaX3PTolv9WBDTUUAEBjkU5hd9G1By6eN7ZHn189/O93SyoTy96d\nWDxh7JND9u9255T5e196aSoGBABIpXQ6eaLr8Y/d/fYBJ9/xxOB+j2fltty8a5cOGxTm5eVU\nli+eN/P7LyZ/PrusIiMjo++ptz99WrdUDwsA0NDSKexCyBxy2wsHDf7n7fePHD3mjYmfvD95\n/NLjdhmZeZ26dN+/74FHDznzkJ07pnZKAICUSK+wCyGEjr0Pvar3oVeFkKgonTt3QUlpeW5B\nk+aFrQrW6KLElZWVo0ePLisrW8k+VVVVkyZNuvDCC3Nzc9d0agCAepd+YVcjI7ugVduCVmv3\nIGPGjBk4cGAye2ZmZg4b5ioqAEDjlcZht4zBgwe37vaHm4f2XK2v6tu379NPP73yI3bFxcVF\n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\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBIZKd6AAAaQlUIIYTi4uIUz7F28vPz+/fvn5WVlepBoJESdgDrhfdDCCEUFRUVFRWl\neJS1M2rUqAEDBqR6CmikhB3AeqE8hBDCuSH0SfEga+6NEG4MobS0NNWDQOMl7ADWI31CGJTq\nGYD64+QJAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEhkp3qA9UtlZeXo0aPLyspS\nPcgaKi4uTvUIAMAKCbsG9dxzzw0cODDVUwAAcRJ2Daq0tDSEcG4IfVI9yZp5KIRnUj0DALAi\n6Rp2c77/ctKkydNnzy9ZVJad37Rlm3Zdt+62efvCVM+VlD4hDEr1DGvGC7EA0JilWdglKuc9\nWnT5LfeOeH3i9OXvbbd1n2OGnHXxWUcVZmc0/GwAAKmVTmFXWf7tiTtvO3zcrKyc1r33Gdir\nW5f2bQvz8rIrFi+eO3Pa1MnjXx/75o3nH/3QiGc+LH6oQ64TfgGA9Us6hV3xef2Gj5u1++k3\nj7zm1E5N65i8qnzWyGtPG3zpiP3PGDL+r3s3+IAAAKmUToe1hg6f3Kz9KWNvPbPOqgshZOa2\nOfbiR+7svdHnjwxr4NkAAFIuncLuo5IlzTofvMrddtxzwyWLxjfAPAAAjUo6hd0hbQrmTLxm\nWnnVynaqKr3v0Sn5rQ5sqKEAABqLdAq7i649cPG8sT36/Orhf79bUplY9u7E4gljnxyyf7c7\np8zf+9JLUzEgAEAqpdPJE12Pf+zutw84+Y4nBvd7PCu35eZdu3TYoDAvL6eyfPG8md9/Mfnz\n2WUVGRkZfU+9/enTuqV6WACAhpZOYRdC5pDbXjho8D9vv3/k6DFvTPzk/cnjlx63y8jM69Sl\n+/59Dzx6yJmH7NwxtVMCAKREeoVdCCF07H3oVb0PvSqEREXp3LkLSkrLcwuaNC9sVbBGFyWu\nrKwcPXp0WVnZSvap/uT7qqqVvrcPACDV0i/samRkF7RqW9Bq7R5kzJgxAwcOTGbP8eOdaQsA\nNGppHHbrRN++fZ9++ulVHrErKirq3r17g00FALAG1vewy8rKOvjgVV8br6ioKDMznc4gBgDW\nQ2IFACAS6XTEbu6070sqkz2DoWNH58YCAOuXdAq732+/5T3TFia5cyKx3BWMAQCilk5h9+cX\nntvqgdsvKfp7aWWiVc+9d9ukWaonAgBoRNIp7Dbqvvv5f9m9b+svdhr6VrfT7hx18tapnggA\noBFJv5Mnep52Q6pHAABojNIv7HJb7L5Dp3Yt87NSPQgAQOOSTi/F1nj36+9TPQIAQKOTfkfs\nAACok7ADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiER2qgcAgPVCZWXl6NGjy8rKUj3IGsrPz+/fv39W\nVlaqB2FlhB0ANITnnntu4MCBqZ5irYwaNWrAgAGpnoKVEXYA0BBKS0tDCOeG0CfVk6yBN0K4\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "hist(income_data$income, main = \"Frequency Plot\", \n",
    "     xlab = \"Values\", \n",
    "     ylab = \"Frequency\", \n",
    "     col = \"red\",\n",
    "     border = \"black\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "abbbb36c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-06T12:12:39.763888Z",
     "iopub.status.busy": "2023-04-06T12:12:39.762168Z",
     "iopub.status.idle": "2023-04-06T12:12:39.868614Z",
     "shell.execute_reply": "2023-04-06T12:12:39.866411Z"
    },
    "papermill": {
     "duration": 0.116547,
     "end_time": "2023-04-06T12:12:39.871605",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.755058",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd1wT5wMG8DeTsKeIgggyVJYIihsXiBMRN1ato3XW1v6s2tbWVa2t1mrFhYKo\nVdAKouCquDeiOHGioMjeM0DG749gRERFSniT4/n+0U+8XC4PR2we7+59jyWVSgkAAAAAqD42\n7QAAAAAAUD9Q7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ\n7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUO\nAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAA\nAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAA\ngCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7AAAAAAY\nAsUOAAAAgCFQ7AAAAAAYAsUOAAAAgCFQ7ABqJcK+Cat2mnc5Rjss812a1Ea2t9X1PWhnUbiy\n/DM1ftJ4agJj01YePuN/Cz5ZJq3+qvRrg+VrJpaJGyDnu+/Y8L+mhv+pAZQNih2AyuvWvp2j\no6Ojo+P4f57TzqIyGLDTROVlmSnPTx36e+Gkfs2dRt0uKK/HjSv//lH+hABUcGkHAID/6sG9\ne7kiCSFEJ6eMdhaVwbCdlnPvn54uWmmPgwT19K915d8/yp8QgAoUO4BaGXT5cZZIIv9j4cuV\nlu3Xyh532xZ7aJiF/Ck2V6eBs0HjYTXmyDX/TrLHxXnp108d+Pm7FfEF5YSQ/IQd3lu++3dm\nW9mzxh1CsrIqj+Hpq3EaIFvDv6NyZgCgC8UOoFZ4uvqGVf9YpC5/zNXWMzQ0fPclDSDz6oU7\nxeUVr6+vyn945dSpV4auPZz1+FTyqASV3mlcga78w2ZoaGhu9XP/gS6WrXwyK8SEkAuLvhHN\nOMFlEUIIi6Ndt09lnfdPnd/xU30gYYNlAFBeUgD4dPmJP8r/EvUMfVr1qXvrKg+osLn6Uqk0\n7dKe4d0c9QW8RKFItoJEXBy+cengnh2bG+ryOVx1LV0rB7fxc5ZcfVlU7V3Kch+uXTCtu5OV\ngbY6T13brLXruDkrrqeWyFc4aGf07l/q/mdfyVeQVGTvX7fIu2f7Zka6PJ7AqFkL98Hj1oae\nr5C89UYfzVzVL1Z6spW1zb6VL0yP9ZMHGHcjQ77cRauyDZj3j6rHVBc/by17SqDXV75+xrX1\n2pzKM5Gtx6yrIfrHdtrR4a3kS47lCKu+6ubi9rLlHL5JerlYKpWe9rGULdEwGiGVCHctndnO\nsrk6T725pf24r5bEJBe/+9YZt6K+njjU1txEg6/W1Ny2h9fYgMMx78spJ8w7LU/V+vOL765w\nemob+QprkwtlC9OuDpIvfP7m9yi5GLJ+TP8e5sb6alyulp6hfcdeXy3xf1JYXpv98+HPybvv\nWPXXJC7PXP+/CXbmTQU89eatHD6f99uTooq3foqq+7OK4rTt8s3+mJj/4YTv+aml0rp+6q7s\n+sWrg62+lppAS8+ha//f91772K8LgDIUO4C6qGWxy7r5lz6XXfVrRlyeOsW1ybtfS4QQjlrz\ngPs58u2kX95qo8F7dzWuoMXa82mydT5c7AqTjvdtoVXje5m6T39cUlHLzNXE+3epXJmjmVkh\nli28PK2tfON2M67IFgpzo+ULP7uaVo+p3i12xSnHWr/eXaYePxSL3/66ruIDOy3v6TL5kh6B\nj6q+aq6ZduXGe4fKllQpIsM3+lpX2yCHZ7go9K0tnF47kcdivfvW5n1mviz7ULv7aLHLS1go\nX6H7jso3raHiSMqW+rSucc/zddr8fS/no/vnw5+TDxQ7NZ0u33Ss/rEXGDgfe/XmHzMKLXZ1\n+9RF/9z33fW911z/wC8LgDoUO4C6qF2x0xnVTLPa18yV/zm/+WJrYunasUNbqzdfeDoWc2Ub\nKcu/ZKNeWVNYLJZ523bt2rTivq4FXPVWt4veHGKRf7923fJAvlBUmtDbqMr5YnVDBycbDc6b\nS+ubdv1eXLvM1RSn/y1fYdHzfNnCReZvrizUafmzbGHq5RGVPwJHXbap+kpVrdhVlDz0Mqlc\nwcj5i4xy8buxq6lxp0ml4l56AtlyPetf5Esriu/LO9msuEzZQnkRYbHVKsPoG1etbhye0anc\nysN+yf8uYL1+Sr9N5+Fjx3h0fVOFm/dc9oGoHy125UU35StYjTorW/huxXm8480S3ZZOHl79\nunZoy3mdSmDQp6RKG65x/3z4c/KBYienpmfMZ7/ZRZom3gUiSbX9+dFi94GENRa7un3qWCy2\n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\n2eOioqK8vDxCiFQqlT0ghIhEosLCwqSkJEJIy5YtNTU1+Xy+7Cl1dXWBQMDhcHR0dLS1tTU1\nNTU0NPT19TU0NDQ1NQ0NDY2MjAwNDeXrAwAoDoodACiErNgdPXqUVrHLy8tLSkp68eJFUlJS\nZmZmZmZmamqq7EFKampRYeEnbY3D5XLVBeXFJUQiyUh7KSwTlZWLPmkLuro6xsbGRkZNjIyM\njIyMzF4zNzc3MzPT08MsgABQD3AqFgAUory83MjIyNnZ+fz584p+oydPnjx8+DAxMTEpKany\nv0lJBfn51dZksdnqurp8XW2Bnp5AT1egq8vX1uKqC3gCdZ6mBk9DnaeuzlUXcNXV+ZqasvV5\nGupVt3Bk5tzS1JQ74ZPfClAhFpaJxBJpUUlFUUm5sExUWiYqKCorLROVCEV5hcLcAmFuvjAn\nX5iTX5pbWJabL6wQiatl09LSNDdv2aJFCysrK2tra1tbWxsbG0tLSx6Pp4B9BgCMhSN2AKAQ\nfD6/T58+R44cycvLq8fDUXl5eY8ePYqPj3/06NHDhw/vx8cnPn8uEr05eMbhcjWaGGlYmBs1\nMdI0bqLZ1FjTyFCgr6emoyPQ1SEKuOCPz+PweRxCiL6OoJYvKSwuT88pTsssTssuTsssSs0q\nTssqTs9OPX/uyYkTJ+SrcblcC4uWNja2tra2Dg4OTk5O9vb2mpqa9f4jAABjoNgBgKIMGDDg\n0KFD0dHRI0aMqPNGUlJSbt68GRcXFxcXd+PmzRdJSfKn2FyudjOTZm6uOmamOmamWiZNtUyM\nBfr6yj9cQ1uTr63Jt26h/+5TmTkliSn5SakFSSn5iSn5SSm5p0+dPHbsmOxZNpvdqpWlk1M7\nR0dHR0dHZ2dnKyurhs0OAEoNp2IBQFFevnxpbm4+efLkwMDA2r8qLS3typUrsbGxsiaXkZ4u\nW87mcnXNzfQsWuq2MNNpYapjZqZl0pTN5Sgme81qPBWraFIpScksfJyY+zgx51Fi9uOk3Oev\n8sXiyjkCDQz03dw6ubm5dezY0c3NzdjYuCGzAYCyQbEDAAWyt7fPzc398KQnEokkPj7+kszl\ny88SEmTLuWp83ZbmBlat9K0sDaxa6VmYs2lfcEal2L2rvEL89GXe48Sc+ISsO48zHzzLlo/k\nsLBo6ebWqWvXru7u7u3atWOzMVkpQOOCYgcACvTdd9+tWbPm1q1b1cbGikSi69evnzp16vLl\n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\nNm3atGnTpnXr1q1btzb8wt/fX27g+5SXl5ecnJySkpKcnJyammr4Z01NjeGjKpWqdevATp06\nd+zYsWPHjp06dQoMDFSpVHIzAzAfFDsAlqSysjIxMfHSpUvx8fHx8fEpKSnXr1/XarW/fELj\nxo1btWoVEBDQrFkzf39/f3//pk2bNm/e3N/f383NTWLyf1dUVJSXl3fz5s3MzMyMjIwbN25k\nZmbevHkzIyOjqqrql0+ztbVt1apVu3bt/Pz8GjduPHXq1A4dOjg7O0tMDsDMUewAWLba2tr0\n9PSUlBTDKldKSkpaWlpGRkZlZeV/faajo2OTJk2aNGni6enp5eXl6en5y28dHBxcXV0dHR0b\nN27s4uLi5OTUqFGjOxzRLSsrMzTL4uLiioqK8vLyioqK4uLi8vLy8vLysrKygoKCvH/Kz88v\nKCioq6v7r4u4uLi0+KegoKB27dq1a9eudevWjI8AuCsUOwDKVFRUdPPmzRs3bmRlZWVmZmZm\nZmZnZxcUFOTn5+fl5ZWWlt7V1WxsbFxcXH75rVarLSsru6sruLi4+Pn5eXt7e3l5eXt7+/n5\n+fv7BwQEtGzZMiAgwN3d/a6uBgC/imIHwBrV1dUVFBQYel5RUVF1dXVpaWl5ebnhFxUVFVVV\nVf9V/oqLi3/5hmlnZ/fLLVF3d3fDU25ubm7O/+Th4WH4hYuLi6HJce4qgAZAsQMAAFAI5e8U\nAAAAYCUodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAA\nQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEo\ndgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAA\nAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApB\nsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMA\nAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAI\nih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0A\nAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBC\nUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwA\nAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAU\ngmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIH\nAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACg\nEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7\nAAAAhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAA\nhaDYAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDY\nAQAAKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAA\nKATFDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATF\nDgAAQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAA\nQCEodgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEo\ndgAAAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAA\nAApBsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhaDYAQAAKATFDgAAQCEodgAAAApB\nsQMAAFAIih0AAIBCUOwAAAAUgmIHAACgEBQ7AAAAhfh/7dhhsVRazhEAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "pie(table(income_data$work), main= 'Tractor work-type Distribution', col= brewer.pal(3,\"BrBG\"), clockwise=TRUE, radius=1.8)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "58e64f2c",
   "metadata": {
    "papermill": {
     "duration": 0.005703,
     "end_time": "2023-04-06T12:12:39.883686",
     "exception": false,
     "start_time": "2023-04-06T12:12:39.877983",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 6.158381,
   "end_time": "2023-04-06T12:12:40.012561",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-04-06T12:12:33.854180",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
