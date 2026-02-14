declare module '@apiverve/gdp' {
  export interface gdpOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface gdpResponse {
    status: string;
    error: string | null;
    data: GDPDataData;
    code?: number;
  }


  interface GDPDataData {
      country:     string;
      countryName: string;
      currency:    string;
      year:        number;
      count:       number;
      historical:  Historical[];
  }
  
  interface Historical {
      year:         number;
      gdp:          number;
      gdpFormatted: string;
      gdpGrowth:    number;
      gdpPerCapita: number;
  }

  export default class gdpWrapper {
    constructor(options: gdpOptions);

    execute(callback: (error: any, data: gdpResponse | null) => void): Promise<gdpResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: gdpResponse | null) => void): Promise<gdpResponse>;
    execute(query?: Record<string, any>): Promise<gdpResponse>;
  }
}
