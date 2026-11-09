using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.GDPData
{
    /// <summary>
    /// Query options for the GDP Data API
    /// </summary>
    public class GDPDataQueryOptions
    {
        /// <summary>
        /// ISO 2 or 3-letter country code (e.g., US, USA, GB, GBR)
        /// </summary>
        [JsonProperty("country")]
        public string Country { get; set; }

        /// <summary>
        /// Specific year to retrieve data for (1960-present). Returns latest if not specified.
        /// </summary>
        [JsonProperty("year")]
        public int? Year { get; set; }

        /// <summary>
        /// Include the change against the previous year, the growth trend, the 5-year average growth rate and the 5- and 10-year compound annual growth rates
        /// </summary>
        [JsonProperty("changes")]
        public bool? Changes { get; set; }
    }
}
