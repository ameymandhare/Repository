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
