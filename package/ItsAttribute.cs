using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using Xunit;

namespace MidnightLizard.Testing.Utilities
{
    /// <summary>
    /// Xunit Theory with custom test name processing
    /// </summary>
    public class ItsAttribute : TheoryAttribute
    {
        public ItsAttribute(string it, [CallerMemberName]string should = "") : base()
        {
            DisplayName = $"{it} - {should} ".Replace("__", ".").Replace("_", " ");
        }

    }
}
