using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VoatingSystem.Business.Entities
{
    public class VotetedStudents
    {
        private int vst_Id;
        private string vst_StudentKey;
        private bool vst_IVFHouse;
        private bool vst_IVFHeadSenate;
        private bool vst_IVFGamesCap;
        private bool vst_IVFGamesViceCap;
        private bool vst_IVFPrfect;

        public bool Vst_IVFPrfect
        {
            get { return vst_IVFPrfect; }
            set { vst_IVFPrfect = value; }
        }
        private bool vst_IVFVicePrefect;

        public bool Vst_IVFVicePrefect
        {
            get { return vst_IVFVicePrefect; }
            set { vst_IVFVicePrefect = value; }
        }
        private bool vst_IVFJuniorPrefet;

        public bool Vst_IVFJuniorPrefet
        {
            get { return vst_IVFJuniorPrefet; }
            set { vst_IVFJuniorPrefet = value; }
        }
        private bool vst_IVFHeadBoy;

        public bool Vst_IVFHeadBoy
        {
            get { return vst_IVFHeadBoy; }
            set { vst_IVFHeadBoy = value; }
        }
        private bool vst_IVFHeadGirl;

        public bool Vst_IVFHeadGirl
        {
            get { return vst_IVFHeadGirl; }
            set { vst_IVFHeadGirl = value; }
        }

        Nominees nomiees;

        public Nominees Nomiees
        {
            get { return nomiees; }
            set { nomiees = value; }
        }
        

        public bool Vst_IVFGamesViceCap
        {
            get { return vst_IVFGamesViceCap; }
            set { vst_IVFGamesViceCap = value; }
        }

        public bool Vst_IVFGamesCap
        {
            get { return vst_IVFGamesCap; }
            set { vst_IVFGamesCap = value; }
        }

        public bool Vst_IVFHeadSenate
        {
            get { return vst_IVFHeadSenate; }
            set { vst_IVFHeadSenate = value; }
        }

        public bool Vst_IVFHouse
        {
            get { return vst_IVFHouse; }
            set { vst_IVFHouse = value; }
        }

        public string Vst_StudentKey
        {
            get { return vst_StudentKey; }
            set { vst_StudentKey = value; }
        }

        public int Vst_Id
        {
            get { return vst_Id; }
            set { vst_Id = value; }
        }
    }
}
