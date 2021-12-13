﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Windows;

namespace Fosec.Utils
{
    public class ValidationUtil
    {
        public static readonly string RESULT_PASS = "pass";

        public string ValidatePassword(string pwd)
        {
            var hasNumber = new Regex(@"[0-9]+");
            var hasUpperChar = new Regex(@"[A-Z]+");
            var hasLowerChar = new Regex(@"[a-z]+");
            var hasSymbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");

            if (!hasLowerChar.IsMatch(pwd))
            {
                return "Password should contain At least one lower case letter";
            }

            else if (!hasUpperChar.IsMatch(pwd))
            {
                return "Password should contain At least one upper case letter";
            }

            else if (!hasNumber.IsMatch(pwd))
            {
                return "Password should contain At least one numeric value";
            }

            else if (!hasSymbols.IsMatch(pwd))
            {
                return "Password should contain At least one special case characters";
            }

            else
            {
                return RESULT_PASS;
            }    
        }

        public string ValidateUname(string uname)
        {
            if(uname.Length < 6)
            {
                return "Username must contain at least 6 characters.";
            }

            else
            {
                return RESULT_PASS;
            }
        }

        public string ValidateEmail(string email)
        {
            var pattern = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");

            if(!pattern.IsMatch(email))
            {
                return "Invalid email address!";
            }

            else
            {
                return RESULT_PASS;
            }
        }
    }
}