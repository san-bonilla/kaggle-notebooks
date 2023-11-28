{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "015cb019",
   "metadata": {
    "papermill": {
     "duration": 0.001561,
     "end_time": "2023-11-28T19:30:12.599285",
     "exception": false,
     "start_time": "2023-11-28T19:30:12.597724",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Análisis de series temporales de la tasa de desempleo en Canadá"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "21dd11c2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-28T19:30:12.604381Z",
     "iopub.status.busy": "2023-11-28T19:30:12.602837Z",
     "iopub.status.idle": "2023-11-28T19:30:13.231216Z",
     "shell.execute_reply": "2023-11-28T19:30:13.229907Z"
    },
    "papermill": {
     "duration": 0.632669,
     "end_time": "2023-11-28T19:30:13.233008",
     "exception": false,
     "start_time": "2023-11-28T19:30:12.600339",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m38985\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (4): REF_DATE, GEO, Sex, Age group\n",
      "\u001b[32mdbl\u001b[39m (9): Employment, Full-time employment, Labour force, Part-time employmen...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>REF_DATE</th><th scope=col>GEO</th><th scope=col>Sex</th><th scope=col>Age group</th><th scope=col>Employment</th><th scope=col>Full-time employment</th><th scope=col>Labour force</th><th scope=col>Part-time employment</th><th scope=col>Population</th><th scope=col>Unemployment</th><th scope=col>Employment rate</th><th scope=col>Participation rate</th><th scope=col>Unemployment rate</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1976-01</td><td>Alberta</td><td>Both sexes</td><td>15 to 24 years   </td><td>231800</td><td>174900</td><td>252300</td><td> 56900</td><td> 362300</td><td>20500</td><td>64.0</td><td>69.6</td><td>8.1</td></tr>\n",
       "\t<tr><td>1976-01</td><td>Alberta</td><td>Both sexes</td><td>15 to 64 years   </td><td>802400</td><td>682100</td><td>837500</td><td>120300</td><td>1154800</td><td>35000</td><td>69.5</td><td>72.5</td><td>4.2</td></tr>\n",
       "\t<tr><td>1976-01</td><td>Alberta</td><td>Both sexes</td><td>15 years and over</td><td>819500</td><td>693700</td><td>856500</td><td>125800</td><td>1276700</td><td>37000</td><td>64.2</td><td>67.1</td><td>4.3</td></tr>\n",
       "\t<tr><td>1976-01</td><td>Alberta</td><td>Both sexes</td><td>25 to 54 years   </td><td>491400</td><td>439800</td><td>505800</td><td> 51600</td><td> 661700</td><td>14400</td><td>74.3</td><td>76.4</td><td>2.8</td></tr>\n",
       "\t<tr><td>1976-01</td><td>Alberta</td><td>Both sexes</td><td>25 years and over</td><td>587700</td><td>518800</td><td>604200</td><td> 68900</td><td> 914400</td><td>16500</td><td>64.3</td><td>66.1</td><td>2.7</td></tr>\n",
       "\t<tr><td>1976-01</td><td>Alberta</td><td>Both sexes</td><td>55 years and over</td><td> 96300</td><td> 79000</td><td> 98400</td><td> 17300</td><td> 252800</td><td> 2100</td><td>38.1</td><td>38.9</td><td>2.1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " REF\\_DATE & GEO & Sex & Age group & Employment & Full-time employment & Labour force & Part-time employment & Population & Unemployment & Employment rate & Participation rate & Unemployment rate\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1976-01 & Alberta & Both sexes & 15 to 24 years    & 231800 & 174900 & 252300 &  56900 &  362300 & 20500 & 64.0 & 69.6 & 8.1\\\\\n",
       "\t 1976-01 & Alberta & Both sexes & 15 to 64 years    & 802400 & 682100 & 837500 & 120300 & 1154800 & 35000 & 69.5 & 72.5 & 4.2\\\\\n",
       "\t 1976-01 & Alberta & Both sexes & 15 years and over & 819500 & 693700 & 856500 & 125800 & 1276700 & 37000 & 64.2 & 67.1 & 4.3\\\\\n",
       "\t 1976-01 & Alberta & Both sexes & 25 to 54 years    & 491400 & 439800 & 505800 &  51600 &  661700 & 14400 & 74.3 & 76.4 & 2.8\\\\\n",
       "\t 1976-01 & Alberta & Both sexes & 25 years and over & 587700 & 518800 & 604200 &  68900 &  914400 & 16500 & 64.3 & 66.1 & 2.7\\\\\n",
       "\t 1976-01 & Alberta & Both sexes & 55 years and over &  96300 &  79000 &  98400 &  17300 &  252800 &  2100 & 38.1 & 38.9 & 2.1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| REF_DATE &lt;chr&gt; | GEO &lt;chr&gt; | Sex &lt;chr&gt; | Age group &lt;chr&gt; | Employment &lt;dbl&gt; | Full-time employment &lt;dbl&gt; | Labour force &lt;dbl&gt; | Part-time employment &lt;dbl&gt; | Population &lt;dbl&gt; | Unemployment &lt;dbl&gt; | Employment rate &lt;dbl&gt; | Participation rate &lt;dbl&gt; | Unemployment rate &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1976-01 | Alberta | Both sexes | 15 to 24 years    | 231800 | 174900 | 252300 |  56900 |  362300 | 20500 | 64.0 | 69.6 | 8.1 |\n",
       "| 1976-01 | Alberta | Both sexes | 15 to 64 years    | 802400 | 682100 | 837500 | 120300 | 1154800 | 35000 | 69.5 | 72.5 | 4.2 |\n",
       "| 1976-01 | Alberta | Both sexes | 15 years and over | 819500 | 693700 | 856500 | 125800 | 1276700 | 37000 | 64.2 | 67.1 | 4.3 |\n",
       "| 1976-01 | Alberta | Both sexes | 25 to 54 years    | 491400 | 439800 | 505800 |  51600 |  661700 | 14400 | 74.3 | 76.4 | 2.8 |\n",
       "| 1976-01 | Alberta | Both sexes | 25 years and over | 587700 | 518800 | 604200 |  68900 |  914400 | 16500 | 64.3 | 66.1 | 2.7 |\n",
       "| 1976-01 | Alberta | Both sexes | 55 years and over |  96300 |  79000 |  98400 |  17300 |  252800 |  2100 | 38.1 | 38.9 | 2.1 |\n",
       "\n"
      ],
      "text/plain": [
       "  REF_DATE GEO     Sex        Age group         Employment Full-time employment\n",
       "1 1976-01  Alberta Both sexes 15 to 24 years    231800     174900              \n",
       "2 1976-01  Alberta Both sexes 15 to 64 years    802400     682100              \n",
       "3 1976-01  Alberta Both sexes 15 years and over 819500     693700              \n",
       "4 1976-01  Alberta Both sexes 25 to 54 years    491400     439800              \n",
       "5 1976-01  Alberta Both sexes 25 years and over 587700     518800              \n",
       "6 1976-01  Alberta Both sexes 55 years and over  96300      79000              \n",
       "  Labour force Part-time employment Population Unemployment Employment rate\n",
       "1 252300        56900                362300    20500        64.0           \n",
       "2 837500       120300               1154800    35000        69.5           \n",
       "3 856500       125800               1276700    37000        64.2           \n",
       "4 505800        51600                661700    14400        74.3           \n",
       "5 604200        68900                914400    16500        64.3           \n",
       "6  98400        17300                252800     2100        38.1           \n",
       "  Participation rate Unemployment rate\n",
       "1 69.6               8.1              \n",
       "2 72.5               4.2              \n",
       "3 67.1               4.3              \n",
       "4 76.4               2.8              \n",
       "5 66.1               2.7              \n",
       "6 38.9               2.1              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Cargar datos\n",
    "df <- readr::read_csv('/kaggle/input/unemployment-in-canada-by-province-1976-present/Unemployment_Canada_1976_present.csv')\n",
    "# Convertir la columna 'REF_DATE' al formato de fecha\n",
    "head(df)"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 3076326,
     "sourceId": 6895838,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30582,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
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
   "duration": 3.426229,
   "end_time": "2023-11-28T19:30:13.353835",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-28T19:30:09.927606",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
