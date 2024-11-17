using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace zcportal.Models
{
    public class FAQ
    {
        public int Id { get; set; }
        public string QuestionTitle { get; set; }
        public string Answer { get; set; }
        public string PostingDate { get; set; }
        public string PhotoFileName { get; set; }

    }
}