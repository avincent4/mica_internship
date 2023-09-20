function pat = pat_dsgnor_3000(Lgnd, Wgnd, La, Wa, Wf, Wi, Li, H)

    Foff   = [-Lgnd/2, 0];

    W2   = Wf + 2*Wi;   %Functionnal format of insert width

    pat = patchMicrostripInsetfed("GroundPlaneLength",Lgnd, "GroundPlaneWidth", Wgnd, ...
                                    "Length", La, "Width", Wa, "NotchLength",Li, "NotchWidth",W2, ...
                                    "Height", H, "StripLineWidth", Wf, "FeedOffset", Foff);
    
    % correctifs
    
    pat.TiltAxis = [1 0 0];

    % Substrate

    d = dielectric;
    d.Name = 'RT5880';
    d.EpsilonR = 2.2;
    d.LossTangent = 0.0009;
    pat.Substrate = d;
    show(pat)

    

end