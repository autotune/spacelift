resource "kubernetes_secret" "jwt-key" {
  provider   = kubernetes
  metadata {
    name      = "jwt-key"
    namespace = "default"
  }

  data = {
    "jwtRS256.key" = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlKS3dJQkFBS0NBZ0VBNEd2Wk5Ta2o1aWlXYjJEWk0yZkN4NWJHR1lnd2FLNFNNc3lJOEs4b0ZRZXBMMTNZClJPWEt3NVMrbEVMSDlBZXRUZGNUQWRrYkN6eWFwU2RrM1Bxd3hoQ2FmNGtudktlUmk3NmNzRzZtYzBrcngxR0kKdFk2NVgrTnEwcWFSdkxkT09iRlFHbUlIeDc1emtaNjU0K2Z0dm52Q1k1T1BqVjQ0TGt0dTF3bHJCbXIyMjVRUwpGYklhOEE5NkJTcEp6S20wYWhLKzZyOFZ2dk9xMUJIR1pJSUtLR1E3L3pMdXhQT24rYzN3Q0YwVlFZMjBZNFhvCm8rRFZ0LyswTUk4T1p2ZEF1YWIyVVh1YitUaXdBZ0c3Njh5bkpQaDdla2xMdGR0QTFCR2dsWG1vRVI0eHZoaFgKUXNPUnRUaTYwRlpQWDdDM1YxcmxVZStyVTlCWTZDbHJXbGVKdGdCZjFYUi90Qm1MZGZCNFlWbkt0ekI3dkxDbApPS3VsdGFkdVNWbmZ2OEMwdXoxelBCWkl3WG5zVk83WHlTVlBBSkJUOFBWR1Iza2JnOW5FRGsvclZsS1lNSW5EClNPOFNITnlLTytrNnBUaG1hbW9xTUJKQkNwY0MrRzFVUFVxWWV1Szh3NjZaU3BLV2ZQY3RtWWViUHNraUpiS2UKT3JIVlUyRGo3enpkaW1MMmJlaHFTd1NpM3pBa2xXZjRGU0F6aC80enBENFdxM0lDd2NYbFBxYTU5T0IwcXFBQwp4NUFtRUZsdlF1VUkwcTZ3WjZ2cmxBWUsrTWRtNER2RkFVbFhzNW1mbDZPRnZ0YkZTZHF1ckU2SXROVnlSVlFBCmx6WFdtaEM4R3JXQklodDFPSkxXREtPNWx2Wm1KUS9sazdic1VyNCsyK05ObnNzTXBuTUI2QytJejZzQ0F3RUEKQVFLQ0FnRUFoQ0c3ZnpzN3NiVlA3VCsrWWkvRFZMUUc2dDF1Y3hPYUQyS3hkZFFLNjJiWlM5UWJFMldnWGtyagpjbk5uT3R5U1F2UlFjcFFiQWlDcWhIYVBRalF2aEU0ZVNOeStFcXN1WEhMYjJsMHJqMUVUZjRVWDBwMjNzeWM0CnE5SDZtSHZzaUxkSERHR1BaeUZROWZuWVJNRTNEeUhhcjdvZm1RSlNYWjk0SVErZ2ZlVFlkeXZWQWdVZEt4NVIKbjF6b21xR0lZYk9yeUphOC9QS0dMOXBQVHJucHRTSmUyTUJxS0hlMC9MVXRrQjhOOXN5eDJxN3E3Q0hpY3pVUQpLRTd5RWRtZHVERC9jYll2ZlNyTkprRlRIV0FmUVBzejZDbmpjNjBsbkRiTXIzVXphUEM0Sk00OEFra1hMdlc1CnVCUTVJNFB1VG5acjhqUUVVWktuNWZrTkJlSG9aNjlZVVp2eWdOcGJRaVMxWi9CRzYwVDVZN1VPY09wWVJ2bCsKL0dSNUFSNnpZQVJKbTBKNmg3U2NsdGhLSjdaVnFldWV5U3B1UG9mTjg0V241Zm1mbWdsR2F0dlc4KzFGR2ZNRQppWGxHbzhHQ1ZyampzN013a0pMT3Jlc0lRblFWK3ZmWC95Nk9WRExMS21yeGJCT3BPcm5TK01icnFoOXBsRGFICks1N0VOVngzWWxVd2M3bFRHd2Q2cS9nVnhSWDZRc1F3VEl5UHVOOUozMWd0dXRCeS9FTVVGc1hJenJhRmRIQzgKZXVlT1N3V0JQT05XbUkzN1BCVTIycXFyMWE3d1Y3Z0lJOGg3WS8waDNDYjFYWjZsQ2FzOCt0emI3VFZNMGxWQwpINWNYaXRqM2xKS1B1b2VzOXpTNFhEQjQ0V1hwZkw4SFVXQ1NuSWF2ZVJYUHhwbDRJbUVDZ2dFQkFQMjJEZml3CmVaRDBSTzlManJSR2cxODJlNnNSZ052VUQrOTFjUnBRNFBDcnlKQm1tTmNWOFBNZVdoZFlPaHdCWW1JMjkyWkkKcjFyeHVwclBCdE43dTNnWmhKYkVXL1IvSFozc2lPSmNycHlhejBVNUpDSzRTOERSbkdnUUdOQUdJNFlsVUNxNwpLL2JOa0JLcnRpSEVpOWV6RGQ3SjIrRGJGK0FiSXNWdlNnNnNHdEp1TG8rY0VRUzFaNzkycTQ5NUt6dWJyUDhvClVIbWFuc1R1ZEtLL1lZY0dlcU9pS2V0bmgrK0ZUc0hXek1NTEJ3VllySVlZRHZ5RWUvZEFkNWUzM3ZTRSsrbXkKZEVaVkZidVRMQmdzSW4wM0dmZ1pnNE56QkNhSm9NZGJtU3NiaUxGMkRTL1g4eXNKNldLYzdVTFMwMXJwSjBLTgo0VldQNjhiZlZOd1YwbmtDZ2dFQkFPSnlKaVN5aGJrL1hEVjRzT2ZLS1BBQ3RJTkN0ZWk2OWpYVVVOUHNhQndNCjFMNURCOU5tNjhLb3piVTN1Rk9QbmRPZERrMms5cm5WS1JkSlYrTHhPQ2NEdE5aMzlGQ3JtbUs3TGc4TnBUM2cKVksxc29YamFtcGI3NU1LWjZzaGFIUDRFUUMvTVVoeVF1UXkydEtUS3JMYUNFRmdzR1RhRHFaOU9xMVdIZzhWNwoxdUkzak8xYnNzNFRQWjJxbXVOYjE0WEMzQnJaeDE4eWY3MnJZMEk5RTAxdXorUmp4VUdSK0E3dlloSklYVWtMCmtzQTJqV1ludktsVmZRRWJpWlVpcjQ0d2IraEZ4Z3JwcVBvSmNCTzgvdS9UYXZ3MjFqbjFkRys3NWZqZnI5M3UKRjExbUh2VVY2Z0RJenN4NDVicDVDek5oUmdTTHNRZk9INFdpdytIcUNrTUNnZ0VCQU1UZGtFZkpmL3IzWDhvaQo0ZStHeTRlRStqOEtqT2VHekhxdHNYNlBCWXdhYjcyRXJ0SXV4MUdPMnE5RW1ZcURsSGpMVi9zNUtVQXpVKzJ0CitRaisrTCsvWlQrcnpBS1M1RU5YZC92Vm1QUVJ1QVZweWwxYWpnVm5ZS3JxMnFZSUxXWjQ2NVRNdWRkL09HMFUKYW5ZWFViK2t3MzE5T3ExbXRFY0VKMTMxOWd3ZWhZMkZTNEhKd3ZiWllGQ1QzNW1ybHQxZzljTGo0RllMb1drRAo4dU1hQjY1RFc4US9IN0gzR3ViRGxSSVovN2JVaHJVaVVuU1dsSUppdHVKclZxRVdYdDF6bHhtR2pHekt0dHRlCjNwYy9IOS96Y3FZdC9mdHdzdWJJWWtadkVCSUFBbmhaTnZCSjYva1liczFESVdONXZlRE1DOWU3eWY2ZmQzOVEKYWtPQWQxa0NnZ0VCQUpCQ2RraFVydHBJSWg4eWgwanpRa2M5QWZESlZBZ3k2MTE1cUJDS2YveTJzK1dONEhOdQpFdTROQ2hmVHFvc1phRXVDdDdVQlRla3ZnaUVDcVltN2NMRnlMQWVobmJTeXpnVHVDRGF3MDc5cXBhZGlHREJjCjI3VXFQaDgzWFJwTVJrSVJSUzd1TkxWY0FYZTNBYmdtSWdlWExvQnRmNVo2SkZxSURLRE5WMFk5VWJVRi9MTE8KQTBoRGU3SnhHSUdWWmVVaU1ZU3RqdFQzMytkZVF6clVtL0p0a09XSUpnZFN6YnYrQnZWc3dua2hkVmtjcDlJWApxSm9jQ3lua2VDN1pUUXdCa1psZ3NmMEx4SW1kNzVlemhKb1dqd2FraksrWnpwYk1Gb01KUmduVmYyOFIrdERhCktCeGQwVmowQUM1ZXBLTVQ2ajVGRy8vRDhkTDUwVjZmOGU4Q2dnRUJBTWgreklJb3FKZWlXTGgzOUFtTTRQZEkKSFNod0lISXBUNUhGS05jOTFzRnRDZFdXVDIweXVPZHNLZU9TTDZjMjJsVFpjcklFZFlDY0Q5SVhyWm8xVmxXOAorSGFmNDFhcHhlaU1PZVBNR3ZlNEQ2ZEdrUXcyWXBuNXlOQUUwYk1qa1hFU3JuMzMvV3JqSFFtWFdvNmFSdnVZCnkrMktzbGwvK1BzajlwNXd3WVYxRGp0QzFXU0lmdFZNMkJuRlViQVVyMmNHSVNXWlNnWU9yUDU1elZKK3REeloKSXhrMDZ6TUNZU3pEL1pPTUJZSjUvTFFPWnlPUUs0R2xnMytUUUNXUERHNTRtUEo0dElmNUZCZ25wSU5QRGNLQwpLc2RTQlg4S0xNeU83aEVzOCtuZFRWNWlxa0pscGNCdVJ3VXVUSmlFakc0MWZnaXZPVThTR0V5elZPbW1NNG89Ci0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg=="

    "jwtRS256.key.pub" = "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQ0lqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FnOEFNSUlDQ2dLQ0FnRUE0R3ZaTlNrajVpaVdiMkRaTTJmQwp4NWJHR1lnd2FLNFNNc3lJOEs4b0ZRZXBMMTNZUk9YS3c1UytsRUxIOUFldFRkY1RBZGtiQ3p5YXBTZGszUHF3CnhoQ2FmNGtudktlUmk3NmNzRzZtYzBrcngxR0l0WTY1WCtOcTBxYVJ2TGRPT2JGUUdtSUh4NzV6a1o2NTQrZnQKdm52Q1k1T1BqVjQ0TGt0dTF3bHJCbXIyMjVRU0ZiSWE4QTk2QlNwSnpLbTBhaEsrNnI4VnZ2T3ExQkhHWklJSwpLR1E3L3pMdXhQT24rYzN3Q0YwVlFZMjBZNFhvbytEVnQvKzBNSThPWnZkQXVhYjJVWHViK1Rpd0FnRzc2OHluCkpQaDdla2xMdGR0QTFCR2dsWG1vRVI0eHZoaFhRc09SdFRpNjBGWlBYN0MzVjFybFVlK3JVOUJZNkNscldsZUoKdGdCZjFYUi90Qm1MZGZCNFlWbkt0ekI3dkxDbE9LdWx0YWR1U1ZuZnY4QzB1ejF6UEJaSXdYbnNWTzdYeVNWUApBSkJUOFBWR1Iza2JnOW5FRGsvclZsS1lNSW5EU084U0hOeUtPK2s2cFRobWFtb3FNQkpCQ3BjQytHMVVQVXFZCmV1Szh3NjZaU3BLV2ZQY3RtWWViUHNraUpiS2VPckhWVTJEajd6emRpbUwyYmVocVN3U2kzekFrbFdmNEZTQXoKaC80enBENFdxM0lDd2NYbFBxYTU5T0IwcXFBQ3g1QW1FRmx2UXVVSTBxNndaNnZybEFZSytNZG00RHZGQVVsWApzNW1mbDZPRnZ0YkZTZHF1ckU2SXROVnlSVlFBbHpYV21oQzhHcldCSWh0MU9KTFdES081bHZabUpRL2xrN2JzClVyNCsyK05ObnNzTXBuTUI2QytJejZzQ0F3RUFBUT09Ci0tLS0tRU5EIFBVQkxJQyBLRVktLS0tLQo="
  }

  type = "kubernetes.io/opaque"
}
