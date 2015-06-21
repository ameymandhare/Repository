﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VoatingSystem.Business.Entities
{
    public class Nominees
    {
        private int nom_Id;

        public int Nom_Id
        {
            get { return nom_Id; }
            set { nom_Id = value; }
        }
        private string nom_Key;

        public string Nom_Key
        {
            get { return nom_Key; }
            set { nom_Key = value; }
        }
        private string nom_Name;

        public string Nom_Name
        {
            get { return nom_Name; }
            set { nom_Name = value; }
        }
        private string nom_ClassSection;

        public string Nom_ClassSection
        {
            get { return nom_ClassSection; }
            set { nom_ClassSection = value; }
        }
        private string nom_PhotoURL;

        public string Nom_PhotoURL
        {
            get { return nom_PhotoURL; }
            set { nom_PhotoURL = value; }
        }
        private int nom_DesignationId;

        public int Nom_DesignationId
        {
            get { return nom_DesignationId; }
            set { nom_DesignationId = value; }
        }
        private string nom_DesignationKey;

        public string Nom_DesignationKey
        {
            get { return nom_DesignationKey; }
            set { nom_DesignationKey = value; }
        }

        private string nom_AboutNominee;

        public string Nom_AboutNominee
        {
            get { return nom_AboutNominee; }
            set { nom_AboutNominee = value; }
        }

        private string nom_DesignationCode;

        public string Nom_DesignationCode
        {
            get { return nom_DesignationCode; }
            set { nom_DesignationCode = value; }
        }
    }
}