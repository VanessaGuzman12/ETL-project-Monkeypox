{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [
    {
     "ename": "IndentationError",
     "evalue": "unindent does not match any outer indentation level (<tokenize>, line 74)",
     "output_type": "error",
     "traceback": [
      "\u001b[1;36m  File \u001b[1;32m<tokenize>:74\u001b[1;36m\u001b[0m\n\u001b[1;33m    2. Subsets of the above dataframe were created:\u001b[0m\n\u001b[1;37m    ^\u001b[0m\n\u001b[1;31mIndentationError\u001b[0m\u001b[1;31m:\u001b[0m unindent does not match any outer indentation level\n"
     ]
    }
   ],
   "source": [
    "Project Name : Monkey Pox Virus\n",
    "Project Team : Vanessa Guzman\n",
    "               Andy de Wind\n",
    "\n",
    "Purpose of the project: Extract , Transform and Load data in order to answer the following questions:\n",
    "\n",
    "    1. Forecast number of monkeypox cases\n",
    "    2. Explore the demographics and symptoms of the disease\n",
    "    3. Determine which cities/countries have the most cases \n",
    "    4. Analyse travel information of infected persons\n",
    "\n",
    "Method:\n",
    "      1. Collect datasets that will help in answering the above questions\n",
    "      2. Load the datasets into Pandas dataframes\n",
    "      3. Transform the loaded data into separate data frames to assist in answering the above questions\n",
    "      4. Load the transformed data frames into Postgres database tables to enable queries to be run.\n",
    "\n",
    "\n",
    "ETL Process:\n",
    "    \n",
    "    1. Run MonkeyPox.ipynb to create Vanessa's Dataframes and Postgres tables\n",
    "    2. Run Project2_MonkeyPox-ETL.ipynb to create Andy's Dataframes and Postgres tables\n",
    "    3. schema.sql : Vanessa's tables Just for reference. Not required to be run as\n",
    "                    the Juypter notebook creates the tables when the\n",
    "                    \"to_sql\" commands are run\n",
    "    4. monkey_pox_tables.sql : Andy's tables Just for reference. Not required to be run as\n",
    "                    the Juypter notebook creates the tables when the\n",
    "                    \"to_sql\" commands are run\n",
    "\n",
    "EXTRACT :\n",
    "    DataSets:\n",
    "      1. Global Monkey Pox cases : https://www.kaggle.com/datasets/andrewmvd/global-monkeypox-cases\n",
    "      2. Cities Population : https://www.kaggle.com/datasets/andrewmvd/global-monkeypox-cases?resource=download\n",
    "      3. Monkey Pox Symptoms : https://www.cdc.gov/poxvirus/monkeypox/symptoms.html\n",
    "      4. Daily_Country_Wise_Confirmed_Cases https://www.kaggle.com/datasets/andrewmvd/global-monkeypox-cases\n",
    "      5. Worldwide_Case_Detection_Timeline https://www.kaggle.com/datasets/andrewmvd/global-monkeypox-cases\n",
    "\n",
    "    Data Files used:\n",
    "\n",
    "        Daily_Country_Wise_Confirmed_Cases.csv\n",
    "        data.json (cities master data)\n",
    "        monkeypox_df.csv (monkeypox master datat)\n",
    "        Monkey_Pox_Cases_Worldwide.csv\n",
    "        Worldwide_Case_Detection_Timeline.csv\n",
    "\n",
    "\n",
    "TRANSFORM AND LOAD:\n",
    "      1. A dataframe \"monkey_pox_df\" was created by reading in the downloaded file monkeypox_df.csv from the dataset Global Monkey Pox cases.\n",
    "         Some of the dataframe columns were then renamed. \"Travel_history (Y/N/NA)\":\"Travel_history\"\n",
    "                                                          \"Hospitalised (Y/N/NA)\":\"hospitalised\"\n",
    "                                                          \"Isolated (Y/N/NA)\":\"Isolated\"\n",
    "         \n",
    "         The dataframe was then inserted into a Postgres table \"monkeypox_master\". Its columns are:\n",
    "            ['ID'\n",
    "            'Status'\n",
    "            'Location'\n",
    "            'City'\n",
    "            'Country'\n",
    "            'Age'\n",
    "            'Gender'\n",
    "            'Date_onset'\n",
    "            'Date_confirmation'\n",
    "            'Symptoms'\n",
    "            'hospitalised'\n",
    "            'Date_hospitalisation'\n",
    "            'Isolated'\n",
    "            'Date_isolation'\n",
    "            'Outcome'\n",
    "            'Contact_comment'\n",
    "            'Contact_ID'\n",
    "            'Contact_location'\n",
    "            'Travel_history'\n",
    "            'Travel_history_entry'\n",
    "            'Travel_history_start'\n",
    "            'Travel_history_location'\n",
    "            'Travel_history_country'\n",
    "            'Genomics_Metadata'\n",
    "            'Confirmation_method'\n",
    "            'Source'\n",
    "            'Source_II'\n",
    "            'Date_entry'\n",
    "            'Date_last_modified'\n",
    "            'Source_III'\n",
    "            'Country_ISO3']\n",
    "\n",
    "    2. Subsets of the above dataframe were created:\n",
    "\n",
    "        monkey_pox_locations_df [\"ID\",\"City\",\"Country\",\"Contact_location\" ]\n",
    "        This dataframe and its table \"monkeypox_locations\" was created to assist in the analysis of the number of infections\n",
    "\n",
    "        monkey_pox_travel_df[\"ID\",\"Travel_history\",\"Travel_history_entry\",\"Travel_history_start\",\"Travel_history_location\",\"Travel_history_country\"]\n",
    "        This dataframe and its table \"monkeypox_travel\" was created to assist in the analysis of how the virus \n",
    "        was spread geeographically ie within and between cities and countries\n",
    "\n",
    "        monkey_pox_symtoms_df[\"Symptoms\"]\n",
    "        This dataframe and its table monkeypox_symptoms contains the list of all known symptoms. Not all symptoms are evident in all infected cases. \n",
    "\n",
    "        cities_master['rank', 'City', 'Country', '2022_Population', '2021_Population','Growth']\n",
    "        This dataframe is a list of cities which can be used to determine the rate of infection per capita in cities with recorded confirmed \n",
    "        cases of the virus\n",
    "########################################ADDED\n",
    "\n",
    "        monkey_pox_age_df[\"Age\", \"Headcount\"]\n",
    "        This dataframe and its table monkeypox_age contains the list of all age groups and the count of infected people. This field presents a conflict due to the\n",
    "        cases confirmed by Portugal, which age groups are unexplicably wide and overlaps among them. \n",
    "\n",
    "        monkey_pox_gender_df[\"Gender\", \"Headcount\"]\n",
    "        This dataframe and its table monkeypox_age contains the list of  genders and the count of infected people. This field was cleaned up using Pandas\n",
    "        to harmonize this column.\n",
    "\n",
    "########################################END ADDED\n",
    "    3. Additional datasets were downloaded and loaded into the following dataframes\n",
    "\n",
    "         Daily_Country_Wise_Confirmed_Cases_df : Table : Daily_CaseLoad_by_Country\n",
    "         Contains information of daily case numbers per country from 6th of May 2022 to 6th of June 2022\n",
    "        ############# Andy, I think a further transformation should be performed on this table to be easier to use. I propose the following:\n",
    "        # daily_pivoted=pd.melt(daily, id_vars='Country')\n",
    "        # daily_pivoted.rename(columns = {'variable':'Date_confirmation', 'Country':'Country', 'value':'Confirmed_Cases'}, inplace = True)\n",
    "        # daily_transformed=daily_pivoted \n",
    "    #\n",
    "    # This will create a table with 3 columns (Country, Date_confirmation and Confirmed Cases that could be joined with other tables using both Date and Country)\n",
    "\n",
    "\n",
    "         Worldwide_Case_Detection_Timeline_df : Table : Worldwide_Case_Detection_Timeline\n",
    "         Contains the following information of confirmed cases :\n",
    "            Date_confirmation\t\n",
    "            Country\t\n",
    "            City\t\n",
    "            Age\t\n",
    "            Gender\t\n",
    "            Symptoms\t\n",
    "            hospitalised\t\n",
    "            Isolated\t\n",
    "            Travel_history\n",
    "\n",
    "    4. All the above dataframes can be used to assist in answerng the questions :\n",
    "\n",
    "        1. Forecast number of monkeypox cases : Extrapolation of daily confirmed cases using \"Daily_Country_Wise_Confirmed_Cases_df\"\n",
    "        2. Explore the demographics and symptoms of the disease :  \n",
    "            <Vanessa can you break down the dataframes \"monkey_pox_df\" and \"Worldwide_Case_Detection_Timeline_df\" to answer questions about age, gender and symptoms>\n",
    "        3. Determine which cities/countries have the most cases : \"monkey_pox_locations_df\" , \"Worldwide_Case_Detection_Timeline_df\", \"cities_master_df\"\n",
    "        4. Analyse travel information of infected persons : \"monkey_pox_travel_df\" \n",
    "         \n",
    "\n",
    "\n",
    "    5. From the dataframes above we got the following insights:\n",
    "\n",
    "        1. The countries with most cases are listed below. Four out of five are located in Europe and three of them shares a common border. \n",
    "        This suggests that distance plays a fundamental role on spreading. This also confirm Spain as the epicenter of the contagion. \n",
    "        \"Spain\"\t    333\n",
    "        \"England\"\t287\n",
    "        \"Portugal\"\t153\n",
    "        \"Canada\"\t110\n",
    "        \"Germany\"\t80\n",
    "      \n",
    "        2. From all individuals we have information about Gender, 329 of them are male while only 8 are females. Those females are widely spreaded,\n",
    "           whith no more than 2 individuals per country (Italy).\n",
    "\n",
    "        "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "interpreter": {
   "hash": "f67272f8226a62d5ad5ad600b8605cb72ba6066dcf629ea2a488df2afb972428"
  },
  "kernelspec": {
   "display_name": "Python 3.10.5 64-bit (windows store)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.10.5"
  },
  "orig_nbformat": 4
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
