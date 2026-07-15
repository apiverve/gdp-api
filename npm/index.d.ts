declare module '@apiverve/gdp' {
  export interface gdpOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface gdpResponse {
    status: string;
    error: string | null;
    data: GDPDataData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface GDPDataData {
      country:      null | string;
      countryName:  null | string;
      currency:     null | string;
      year:         number | null;
      gdp:          number | null;
      gdpFormatted: null | string;
      gdpGrowth:    number | null;
      gdpPerCapita: number | null;
      count:        number | null;
      years:        Year[];
  }
  
  interface Year {
      year:         number | null;
      gdp:          number | null;
      gdpFormatted: null | string;
      gdpGrowth:    number | null;
      gdpPerCapita: number | null;
  }

  export default class gdpWrapper {
    constructor(options: gdpOptions);

    execute(callback: (error: any, data: gdpResponse | null) => void): Promise<gdpResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: gdpResponse | null) => void): Promise<gdpResponse>;
    execute(query?: Record<string, any>): Promise<gdpResponse>;
  }
}
